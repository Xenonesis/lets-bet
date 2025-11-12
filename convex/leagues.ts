import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Query leagues by sport
export const listBySport = query({
  args: { sportId: v.id("sports") },
  handler: async (ctx, args) => {
    return await ctx.db
      .query("leagues")
      .filter((q) => 
        q.and(
          q.eq(q.field("sportId"), args.sportId),
          q.eq(q.field("isActive"), true)
        )
      )
      .order("asc")
      .collect();
  },
});

// Query league by ID
export const getById = query({
  args: { leagueId: v.id("leagues") },
  handler: async (ctx, args) => {
    return await ctx.db.get(args.leagueId);
  },
});

// Admin: Create league
export const create = mutation({
  args: {
    sportId: v.id("sports"),
    name: v.string(),
    code: v.string(),
    logo: v.string(),
    country: v.string(),
    displayOrder: v.number(),
    seasonStart: v.optional(v.string()),
    seasonEnd: v.optional(v.string()),
    createdBy: v.id("users"),
  },
  handler: async (ctx, args) => {
    return await ctx.db.insert("leagues", {
      ...args,
      isActive: true,
      createdAt: Date.now(),
    });
  },
});

// Admin: Update league
export const update = mutation({
  args: {
    leagueId: v.id("leagues"),
    name: v.optional(v.string()),
    code: v.optional(v.string()),
    logo: v.optional(v.string()),
    country: v.optional(v.string()),
    displayOrder: v.optional(v.number()),
    seasonStart: v.optional(v.string()),
    seasonEnd: v.optional(v.string()),
    isActive: v.optional(v.boolean()),
  },
  handler: async (ctx, args) => {
    const { leagueId, ...updates } = args;
    return await ctx.db.patch(leagueId, updates);
  },
});

// Admin: Delete league
export const remove = mutation({
  args: { leagueId: v.id("leagues") },
  handler: async (ctx, args) => {
    await ctx.db.delete(args.leagueId);
  },
});