import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Query user bets
export const listByUser = query({
  args: { 
    userId: v.id("users"),
    limit: v.optional(v.number()),
    status: v.optional(v.union(
      v.literal("pending"),
      v.literal("placed"),
      v.literal("won"),
      v.literal("lost"),
      v.literal("voided"),
      v.literal("cashed_out")
    )),
  },
  handler: async (ctx, args) => {
    let query = ctx.db
      .query("bets")
      .filter((q) => q.eq(q.field("userId"), args.userId));
    
    if (args.status) {
      query = query.filter((q) => q.eq(q.field("status"), args.status));
    }
    
    query = query.order("desc");
    
    const results = await query.collect();
    
    if (args.limit) {
      return results.slice(0, args.limit);
    }
    
    return results;
  },
});

// Query bet by ID with selections
export const getById = query({
  args: { betId: v.id("bets") },
  handler: async (ctx, args) => {
    const bet = await ctx.db.get(args.betId);
    if (!bet) return null;

    const selections = await ctx.db
      .query("betSelections")
      .filter((q) => q.eq(q.field("betId"), args.betId))
      .collect();

    return { ...bet, selections };
  },
});

// Place a bet
export const place = mutation({
  args: {
    userId: v.id("users"),
    type: v.union(v.literal("single"), v.literal("multiple")),
    totalStake: v.number(),
    potentialWin: v.number(),
    selections: v.array(v.object({
      matchId: v.id("matches"),
      marketId: v.id("markets"),
      outcomeId: v.id("outcomes"),
      odds: v.number(),
    })),
  },
  handler: async (ctx, args) => {
    // Validate user wallet has sufficient balance
    const wallet = await ctx.db
      .query("wallets")
      .filter((q) => q.eq(q.field("userId"), args.userId))
      .first();

    if (!wallet || wallet.balance < args.totalStake) {
      throw new Error("Insufficient balance");
    }

    // Validate odds are still current
    for (const selection of args.selections) {
      const outcome = await ctx.db.get(selection.outcomeId);
      if (!outcome || outcome.odds !== selection.odds) {
        throw new Error("Odds have changed");
      }
      
      if (!outcome.isActive || outcome.isSuspended) {
        throw new Error("Market is suspended");
      }
    }

    // Create the bet
    const betId = await ctx.db.insert("bets", {
      userId: args.userId,
      type: args.type,
      status: "placed",
      totalStake: args.totalStake,
      potentialWin: args.potentialWin,
      placedAt: Date.now(),
    });

    // Create bet selections
    for (const selection of args.selections) {
      await ctx.db.insert("betSelections", {
        betId,
        matchId: selection.matchId,
        marketId: selection.marketId,
        outcomeId: selection.outcomeId,
        odds: selection.odds,
        status: "pending",
      });
    }

    // Update wallet balance
    await ctx.db.patch(wallet._id, {
      balance: wallet.balance - args.totalStake,
    });

    // Create transaction record
    await ctx.db.insert("transactions", {
      userId: args.userId,
      walletId: wallet._id,
      type: "bet_placed",
      amount: -args.totalStake,
      balanceBefore: wallet.balance,
      balanceAfter: wallet.balance - args.totalStake,
      status: "completed",
      description: `Bet placed - ${args.type}`,
      createdAt: Date.now(),
    });

    return betId;
  },
});

// Cash out a bet
export const cashOut = mutation({
  args: {
    betId: v.id("bets"),
    cashOutValue: v.number(),
  },
  handler: async (ctx, args) => {
    const bet = await ctx.db.get(args.betId);
    if (!bet) {
      throw new Error("Bet not found");
    }

    if (bet.status !== "placed") {
      throw new Error("Bet cannot be cashed out");
    }

    // Update bet status
    await ctx.db.patch(args.betId, {
      status: "cashed_out",
      cashOutValue: args.cashOutValue,
      settledAt: Date.now(),
    });

    // Update wallet
    const wallet = await ctx.db
      .query("wallets")
      .filter((q) => q.eq(q.field("userId"), bet.userId))
      .first();

    if (wallet) {
      await ctx.db.patch(wallet._id, {
        balance: wallet.balance + args.cashOutValue,
      });

      // Create transaction
      await ctx.db.insert("transactions", {
        userId: bet.userId,
        walletId: wallet._id,
        type: "cashout",
        amount: args.cashOutValue,
        balanceBefore: wallet.balance,
        balanceAfter: wallet.balance + args.cashOutValue,
        status: "completed",
        description: `Cashout for bet ${args.betId}`,
        createdAt: Date.now(),
      });
    }

    return bet;
  },
});

// Admin: Settle bet
export const settle = mutation({
  args: {
    betId: v.id("bets"),
    status: v.union(v.literal("won"), v.literal("lost"), v.literal("voided")),
    actualWin: v.optional(v.number()),
  },
  handler: async (ctx, args) => {
    const bet = await ctx.db.get(args.betId);
    if (!bet) {
      throw new Error("Bet not found");
    }

    // Update bet
    await ctx.db.patch(args.betId, {
      status: args.status,
      actualWin: args.actualWin || 0,
      settledAt: Date.now(),
    });

    // If bet won, update wallet
    if (args.status === "won" && args.actualWin && args.actualWin > 0) {
      const wallet = await ctx.db
        .query("wallets")
        .filter((q) => q.eq(q.field("userId"), bet.userId))
        .first();

      if (wallet) {
        await ctx.db.patch(wallet._id, {
          balance: wallet.balance + args.actualWin,
        });

        // Create transaction
        await ctx.db.insert("transactions", {
          userId: bet.userId,
          walletId: wallet._id,
          type: "bet_won",
          amount: args.actualWin,
          balanceBefore: wallet.balance,
          balanceAfter: wallet.balance + args.actualWin,
          status: "completed",
          description: `Winnings for bet ${args.betId}`,
          createdAt: Date.now(),
        });
      }
    }

    return bet;
  },
});