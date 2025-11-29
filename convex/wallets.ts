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
    upiId: v.string(),
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

    const user = await ctx.db.get(args.userId);
    if (!user) {
      throw new Error("User not found");
    }

    // Create contact in Razorpay
    const contactResponse = await fetch('https://api.razorpay.com/v1/contacts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Basic ${btoa(`${process.env.RAZORPAY_KEY_ID}:${process.env.RAZORPAY_KEY_SECRET}`)}`
      },
      body: JSON.stringify({
        name: `${user.firstName} ${user.lastName}`,
        email: user.email,
        contact: user.phone || '',
        type: 'customer',
        reference_id: user._id.toString()
      })
    });

    const contact = await contactResponse.json();
    if (!contact.id) {
      throw new Error('Failed to create contact');
    }

    // Create fund account
    const fundAccountResponse = await fetch('https://api.razorpay.com/v1/fund_accounts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Basic ${btoa(`${process.env.RAZORPAY_KEY_ID}:${process.env.RAZORPAY_KEY_SECRET}`)}`
      },
      body: JSON.stringify({
        contact_id: contact.id,
        account_type: 'vpa',
        vpa: { address: args.upiId }
      })
    });

    const fundAccount = await fundAccountResponse.json();
    if (!fundAccount.id) {
      throw new Error('Failed to create fund account');
    }

    // Create payout
    const idempotencyKey = crypto.randomUUID();
    const payoutResponse = await fetch('https://api.razorpay.com/v1/payouts', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-Payout-Idempotency': idempotencyKey,
        'Authorization': `Basic ${btoa(`${process.env.RAZORPAY_KEY_ID}:${process.env.RAZORPAY_KEY_SECRET}`)}`
      },
      body: JSON.stringify({
        account_number: process.env.RAZORPAY_ACCOUNT_NUMBER,
        fund_account_id: fundAccount.id,
        amount: args.amount * 100, // to paise
        currency: 'INR',
        mode: 'UPI',
        purpose: 'payout',
        queue_if_low_balance: true,
        reference_id: `withdraw_${Date.now()}`,
        narration: 'Withdrawal from SportsBet Pro'
      })
    });

    const payout = await payoutResponse.json();
    if (!payout.id) {
      throw new Error('Failed to create payout');
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
      status: payout.status === 'queued' ? 'pending' : 'processing',
      reference: payout.id,
      description: `Withdrawal to UPI: ${args.upiId}`,
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

    const results = await query.collect();
    
    if (args.limit) {
      return results.slice(0, args.limit);
    }

    return results;
  },
});