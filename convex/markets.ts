import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Query markets by match
export const listByMatch = query({
  args: { matchId: v.id("matches") },
  handler: async (ctx, args) => {
    return await ctx.db
      .query("markets")
      .filter((q) => q.eq(q.field("matchId"), args.matchId))
      .order("asc")
      .collect();
  },
});

// Query market by ID with outcomes
export const getById = query({
  args: { marketId: v.id("markets") },
  handler: async (ctx, args) => {
    const market = await ctx.db.get(args.marketId);
    if (!market) return null;

    const outcomes = await ctx.db
      .query("outcomes")
      .filter((q) => q.eq(q.field("marketId"), args.marketId))
      .order("asc")
      .collect();

    return { ...market, outcomes };
  },
});

// Admin: Create market
export const create = mutation({
  args: {
    matchId: v.id("matches"),
    name: v.string(),
    type: v.string(),
    description: v.string(),
    category: v.string(),
    displayOrder: v.number(),
    maxStake: v.number(),
    minStake: v.number(),
    margin: v.number(),
    createdBy: v.id("users"),
  },
  handler: async (ctx, args) => {
    return await ctx.db.insert("markets", {
      ...args,
      isActive: true,
      isSuspended: false,
      createdAt: Date.now(),
    });
  },
});

// Admin: Update market
export const update = mutation({
  args: {
    marketId: v.id("markets"),
    name: v.optional(v.string()),
    description: v.optional(v.string()),
    category: v.optional(v.string()),
    displayOrder: v.optional(v.number()),
    isActive: v.optional(v.boolean()),
    isSuspended: v.optional(v.boolean()),
    maxStake: v.optional(v.number()),
    minStake: v.optional(v.number()),
    margin: v.optional(v.number()),
  },
  handler: async (ctx, args) => {
    const { marketId, ...updates } = args;
    return await ctx.db.patch(marketId, updates);
  },
});

// Admin: Suspend/Resume market
export const suspend = mutation({
  args: {
    marketId: v.id("markets"),
    isSuspended: v.boolean(),
  },
  handler: async (ctx, args) => {
    return await ctx.db.patch(args.marketId, {
      isSuspended: args.isSuspended,
    });
  },
});

// Query outcomes by market
export const listOutcomesByMarket = query({
  args: { marketId: v.id("markets") },
  handler: async (ctx, args) => {
    return await ctx.db
      .query("outcomes")
      .filter((q) => q.eq(q.field("marketId"), args.marketId))
      .order("asc")
      .collect();
  },
});

// Admin: Create outcome
export const createOutcome = mutation({
  args: {
    marketId: v.id("markets"),
    name: v.string(),
    odds: v.number(),
    displayOrder: v.number(),
  },
  handler: async (ctx, args) => {
    return await ctx.db.insert("outcomes", {
      ...args,
      isActive: true,
      isSuspended: false,
      updatedAt: Date.now(),
    });
  },
});

// Admin: Update odds
export const updateOdds = mutation({
  args: {
    outcomeId: v.id("outcomes"),
    odds: v.number(),
  },
  handler: async (ctx, args) => {
    return await ctx.db.patch(args.outcomeId, {
      odds: args.odds,
      updatedAt: Date.now(),
    });
  },
});

// Admin: Suspend/Resume outcome
export const suspendOutcome = mutation({
  args: {
    outcomeId: v.id("outcomes"),
    isSuspended: v.boolean(),
  },
  handler: async (ctx, args) => {
    return await ctx.db.patch(args.outcomeId, {
      isSuspended: args.isSuspended,
      updatedAt: Date.now(),
    });
  },
});
