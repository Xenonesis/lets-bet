import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Get user wallet
export const getByUser = query({
  args: { userId: v.id("users") },
  handler: async (ctx, args) => {
    return await ctx.db
      .query("wallets")
      .filter((q) => q.eq(q.field("userId"), args.userId))
      .first();
  },
});

// Deposit funds
export const deposit = mutation({
  args: {
    userId: v.id("users"),
    amount: v.number(),
    paymentMethod: v.string(),
    reference: v.string(),
  },
  handler: async (ctx, args) => {
    const wallet = await ctx.db
      .query("wallets")
      .filter((q) => q.eq(q.field("userId"), args.userId))
      .first();

    if (!wallet) {
      throw new Error("Wallet not found");
    }

    const newBalance = wallet.balance + args.amount;

    // Update wallet balance
    await ctx.db.patch(wallet._id, {
      balance: newBalance,
    });

    // Create transaction record
    await ctx.db.insert("transactions", {
      userId: args.userId,
      walletId: wallet._id,
      type: "deposit",
      amount: args.amount,
      balanceBefore: wallet.balance,
      balanceAfter: newBalance,
      status: "completed",
      reference: args.reference,
      description: `Deposit via ${args.paymentMethod}`,
      createdAt: Date.now(),
    });

    return await ctx.db.get(wallet._id);
  },
});

// Withdraw funds
export const withdraw = mutation({
  args: {
    userId: v.id("users"),
    amount: v.number(),
    bankDetails: v.object({
      accountNumber: v.string(),
      ifsc: v.string(),
      accountHolderName: v.string(),
    }),
  },
  handler: async (ctx, args) => {
    const wallet = await ctx.db
      .query("wallets")
      .filter((q) => q.eq(q.field("userId"), args.userId))
      .first();

    if (!wallet) {
      throw new Error("Wallet not found");
    }

    if (wallet.balance < args.amount) {
      throw new Error("Insufficient balance");
    }

    if (args.amount < 100) {
      throw new Error("Minimum withdrawal amount is ₹100");
    }

    const newBalance = wallet.balance - args.amount;

    // Update wallet balance
    await ctx.db.patch(wallet._id, {
      balance: newBalance,
    });

    // Create transaction record
    await ctx.db.insert("transactions", {
      userId: args.userId,
      walletId: wallet._id,
      type: "withdrawal",
      amount: -args.amount,
      balanceBefore: wallet.balance,
      balanceAfter: newBalance,
      status: "pending", // Withdrawals need admin approval
      description: "Withdrawal request",
      createdAt: Date.now(),
    });

    return await ctx.db.get(wallet._id);
  },
});

// Add bonus
export const addBonus = mutation({
  args: {
    userId: v.id("users"),
    amount: v.number(),
    promotionId: v.optional(v.id("promotions")),
    description: v.string(),
  },
  handler: async (ctx, args) => {
    const wallet = await ctx.db
      .query("wallets")
      .filter((q) => q.eq(q.field("userId"), args.userId))
      .first();

    if (!wallet) {
      throw new Error("Wallet not found");
    }

    const newBonusBalance = wallet.bonusBalance + args.amount;

    // Update wallet bonus balance
    await ctx.db.patch(wallet._id, {
      bonusBalance: newBonusBalance,
    });

    // Create transaction record
    await ctx.db.insert("transactions", {
      userId: args.userId,
      walletId: wallet._id,
      type: "bonus",
      amount: args.amount,
      balanceBefore: wallet.balance,
      balanceAfter: wallet.balance, // Main balance unchanged
      status: "completed",
      description: args.description,
      createdAt: Date.now(),
    });

    // Create user bonus record if from promotion
    if (args.promotionId) {
      const promotion = await ctx.db.get(args.promotionId);
      if (promotion) {
        await ctx.db.insert("userBonuses", {
          userId: args.userId,
          promotionId: args.promotionId,
          amount: args.amount,
          wageringRemaining: args.amount * promotion.wageringRequirement,
          status: "active",
          expiresAt: Date.now() + (promotion.validDays * 24 * 60 * 60 * 1000),
          createdAt: Date.now(),
        });
      }
    }

    return await ctx.db.get(wallet._id);
  },
});

// Get transaction history
export const getTransactions = query({
  args: {
    userId: v.id("users"),
    limit: v.optional(v.number()),
    type: v.optional(v.union(
      v.literal("deposit"),
      v.literal("withdrawal"),
      v.literal("bet_placed"),
      v.literal("bet_won"),
      v.literal("bonus"),
      v.literal("cashout")
    )),
  },
  handler: async (ctx, args) => {
    let query = ctx.db
      .query("transactions")
      .filter((q) => q.eq(q.field("userId"), args.userId));

    if (args.type) {
      query = query.filter((q) => q.eq(q.field("type"), args.type));
    }

    query = query.order("desc");

    if (args.limit) {
      query = query.take(args.limit);
    }

    return await query.collect();
  },
});