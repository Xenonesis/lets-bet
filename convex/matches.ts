import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Query all matches
export const list = query({
  args: { 
    limit: v.optional(v.number()),
  },
  handler: async (ctx, args) => {
    const matches = await ctx.db
      .query("matches")
      .order("desc")
      .collect();
    
    if (args.limit) {
      return matches.slice(0, args.limit);
    }
    return matches;
  },
});

// Query matches by league
export const listByLeague = query({
  args: { 
    leagueId: v.id("leagues"),
    limit: v.optional(v.number()),
  },
  handler: async (ctx, args) => {
    let matchQuery = ctx.db
      .query("matches")
      .filter((q) => q.eq(q.field("leagueId"), args.leagueId))
      .order("desc");
    
    if (args.limit) {
      matchQuery = matchQuery.take(args.limit);
    }
    
    return await matchQuery.collect();
  },
});

// Query featured matches
export const getFeatured = query({
  args: { limit: v.optional(v.number()) },
  handler: async (ctx, args) => {
    let matchQuery = ctx.db
      .query("matches")
      .filter((q) => q.eq(q.field("isFeatured"), true))
      .order("asc");
    
    if (args.limit) {
      matchQuery = matchQuery.take(args.limit);
    }
    
    return await matchQuery.collect();
  },
});

// Query live matches
export const getLive = query({
  args: { limit: v.optional(v.number()) },
  handler: async (ctx, args) => {
    let matchQuery = ctx.db
      .query("matches")
      .filter((q) => q.eq(q.field("status"), "live"))
      .order("asc");
    
    if (args.limit) {
      matchQuery = matchQuery.take(args.limit);
    }
    
    return await matchQuery.collect();
  },
});

// Query upcoming matches
export const getUpcoming = query({
  args: { 
    sportId: v.optional(v.id("sports")),
    limit: v.optional(v.number()),
  },
  handler: async (ctx, args) => {
    const now = Date.now();
    let matchQuery = ctx.db
      .query("matches")
      .filter((q) => 
        q.and(
          q.eq(q.field("status"), "scheduled"),
          q.gt(q.field("startTime"), now)
        )
      );
    
    if (args.sportId) {
      matchQuery = matchQuery.filter((q) => q.eq(q.field("sportId"), args.sportId));
    }
    
    matchQuery = matchQuery.order("asc");
    
    if (args.limit) {
      matchQuery = matchQuery.take(args.limit);
    }
    
    return await matchQuery.collect();
  },
});

// Query match by ID
export const getById = query({
  args: { matchId: v.id("matches") },
  handler: async (ctx, args) => {
    return await ctx.db.get(args.matchId);
  },
});

// Admin: Create match
export const create = mutation({
  args: {
    sportId: v.id("sports"),
    leagueId: v.id("leagues"),
    homeTeam: v.string(),
    awayTeam: v.string(),
    homeTeamLogo: v.optional(v.string()),
    awayTeamLogo: v.optional(v.string()),
    startTime: v.number(),
    isPreMatchEnabled: v.boolean(),
    isLiveEnabled: v.boolean(),
    isFeatured: v.boolean(),
    createdBy: v.id("users"),
  },
  handler: async (ctx, args) => {
    return await ctx.db.insert("matches", {
      ...args,
      status: "scheduled",
      createdAt: Date.now(),
    });
  },
});

// Admin: Update match status
export const updateStatus = mutation({
  args: {
    matchId: v.id("matches"),
    status: v.union(
      v.literal("scheduled"),
      v.literal("live"),
      v.literal("halftime"),
      v.literal("suspended"),
      v.literal("finished"),
      v.literal("cancelled")
    ),
  },
  handler: async (ctx, args) => {
    return await ctx.db.patch(args.matchId, {
      status: args.status,
    });
  },
});

// Admin: Update live stats
export const updateLiveStats = mutation({
  args: {
    matchId: v.id("matches"),
    minute: v.number(),
    period: v.string(),
    possession: v.optional(v.object({
      home: v.number(),
      away: v.number(),
    })),
    corners: v.optional(v.object({
      home: v.number(),
      away: v.number(),
    })),
    cards: v.optional(v.object({
      home: v.number(),
      away: v.number(),
    })),
  },
  handler: async (ctx, args) => {
    const { matchId, ...liveStats } = args;
    return await ctx.db.patch(matchId, {
      liveStats,
    });
  },
});

// Admin: Update score
export const updateScore = mutation({
  args: {
    matchId: v.id("matches"),
    home: v.number(),
    away: v.number(),
  },
  handler: async (ctx, args) => {
    const { matchId, home, away } = args;
    return await ctx.db.patch(matchId, {
      score: { home, away },
    });
  },
});

// Subscribe to match events
export const subscribeEvents = query({
  args: { matchId: v.id("matches") },
  handler: async (ctx, args) => {
    return await ctx.db.get(args.matchId);
  },
});