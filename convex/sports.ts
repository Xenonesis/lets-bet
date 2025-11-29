import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Helper function to format sport for Flutter
function formatSportForFlutter(sport: any) {
  if (!sport) return null;
  return {
    id: sport._id,
    name: sport.name,
    code: sport.code,
    icon: sport.icon,
    themeColor: sport.themeColor,
    displayOrder: sport.displayOrder,
    isActive: sport.isActive,
    createdBy: sport.createdBy,
    createdAt: new Date(sport.createdAt).toISOString(),
  };
}

// Query all active sports
export const list = query({
  args: {},
  handler: async (ctx) => {
    const sports = await ctx.db
      .query("sports")
      .filter((q) => q.eq(q.field("isActive"), true))
      .order("asc")
      .collect();
    return sports.map(formatSportForFlutter);
  },
});

// Query sport by ID
export const getById = query({
  args: { sportId: v.id("sports") },
  handler: async (ctx, args) => {
    const sport = await ctx.db.get(args.sportId);
    return formatSportForFlutter(sport);
  },
});

// Admin: Create sport
export const create = mutation({
  args: {
    name: v.string(),
    code: v.string(),
    icon: v.string(),
    themeColor: v.string(),
    displayOrder: v.number(),
    createdBy: v.id("users"),
  },
  handler: async (ctx, args) => {
    return await ctx.db.insert("sports", {
      ...args,
      isActive: true,
      createdAt: Date.now(),
    });
  },
});

// Admin: Update sport
export const update = mutation({
  args: {
    sportId: v.id("sports"),
    name: v.optional(v.string()),
    code: v.optional(v.string()),
    icon: v.optional(v.string()),
    themeColor: v.optional(v.string()),
    displayOrder: v.optional(v.number()),
    isActive: v.optional(v.boolean()),
  },
  handler: async (ctx, args) => {
    const { sportId, ...updates } = args;
    return await ctx.db.patch(sportId, updates);
  },
});

// Admin: Delete sport
export const remove = mutation({
  args: { sportId: v.id("sports") },
  handler: async (ctx, args) => {
    await ctx.db.delete(args.sportId);
  },
});