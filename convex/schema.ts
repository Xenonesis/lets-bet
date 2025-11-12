import { defineSchema, defineTable } from "convex/server";
import { v } from "convex/values";

export default defineSchema({
  // User Management
  users: defineTable({
    email: v.string(),
    username: v.string(),
    password: v.string(), // hashed
    firstName: v.string(),
    lastName: v.string(),
    phone: v.optional(v.string()),
    dateOfBirth: v.string(),
    country: v.string(),
    isVerified: v.boolean(),
    kycStatus: v.union(v.literal("pending"), v.literal("approved"), v.literal("rejected")),
    isActive: v.boolean(),
    role: v.union(v.literal("user"), v.literal("admin"), v.literal("risk_manager")),
    createdAt: v.number(),
    lastLogin: v.optional(v.number()),
  })
  .index("by_email", ["email"])
  .index("by_username", ["username"]),

  // Sports Management
  sports: defineTable({
    name: v.string(),
    code: v.string(), // e.g., "football", "cricket"
    icon: v.string(),
    themeColor: v.string(),
    displayOrder: v.number(),
    isActive: v.boolean(),
    createdBy: v.id("users"),
    createdAt: v.number(),
  })
  .index("by_code", ["code"])
  .index("by_active", ["isActive"])
  .index("by_display_order", ["displayOrder"]),

  // Leagues Management
  leagues: defineTable({
    sportId: v.id("sports"),
    name: v.string(),
    code: v.string(),
    logo: v.string(),
    country: v.string(),
    isActive: v.boolean(),
    displayOrder: v.number(),
    seasonStart: v.optional(v.string()),
    seasonEnd: v.optional(v.string()),
    createdBy: v.id("users"),
    createdAt: v.number(),
  })
  .index("by_sport", ["sportId"])
  .index("by_active", ["isActive"])
  .index("by_code", ["code"]),

  // Matches Management
  matches: defineTable({
    sportId: v.id("sports"),
    leagueId: v.id("leagues"),
    homeTeam: v.string(),
    awayTeam: v.string(),
    homeTeamLogo: v.optional(v.string()),
    awayTeamLogo: v.optional(v.string()),
    startTime: v.number(),
    status: v.union(
      v.literal("scheduled"),
      v.literal("live"),
      v.literal("halftime"),
      v.literal("suspended"),
      v.literal("finished"),
      v.literal("cancelled")
    ),
    score: v.optional(v.object({
      home: v.number(),
      away: v.number(),
    })),
    liveStats: v.optional(v.object({
      minute: v.number(),
      period: v.string(),
      possession: v.optional(v.object({ home: v.number(), away: v.number() })),
      corners: v.optional(v.object({ home: v.number(), away: v.number() })),
      cards: v.optional(v.object({ home: v.number(), away: v.number() })),
    })),
    isPreMatchEnabled: v.boolean(),
    isLiveEnabled: v.boolean(),
    isFeatured: v.boolean(),
    createdBy: v.id("users"),
    createdAt: v.number(),
  })
  .index("by_sport", ["sportId"])
  .index("by_league", ["leagueId"])
  .index("by_status", ["status"])
  .index("by_start_time", ["startTime"])
  .index("by_featured", ["isFeatured"]),

  // Markets Management
  markets: defineTable({
    matchId: v.id("matches"),
    name: v.string(),
    type: v.string(), // "match_winner", "over_under", "handicap", etc.
    description: v.string(),
    category: v.string(),
    displayOrder: v.number(),
    isActive: v.boolean(),
    isSuspended: v.boolean(),
    maxStake: v.number(),
    minStake: v.number(),
    margin: v.number(),
    createdBy: v.id("users"),
    createdAt: v.number(),
  })
  .index("by_match", ["matchId"])
  .index("by_type", ["type"])
  .index("by_active", ["isActive"]),

  // Market Outcomes
  outcomes: defineTable({
    marketId: v.id("markets"),
    name: v.string(),
    odds: v.number(),
    isActive: v.boolean(),
    isSuspended: v.boolean(),
    displayOrder: v.number(),
    updatedAt: v.number(),
  })
  .index("by_market", ["marketId"])
  .index("by_active", ["isActive"]),

  // Bets Management
  bets: defineTable({
    userId: v.id("users"),
    type: v.union(v.literal("single"), v.literal("multiple")),
    status: v.union(
      v.literal("pending"),
      v.literal("placed"),
      v.literal("won"),
      v.literal("lost"),
      v.literal("voided"),
      v.literal("cashed_out")
    ),
    totalStake: v.number(),
    potentialWin: v.number(),
    actualWin: v.optional(v.number()),
    cashOutValue: v.optional(v.number()),
    placedAt: v.number(),
    settledAt: v.optional(v.number()),
  })
  .index("by_user", ["userId"])
  .index("by_status", ["status"])
  .index("by_placed_at", ["placedAt"]),

  // Bet Selections
  betSelections: defineTable({
    betId: v.id("bets"),
    matchId: v.id("matches"),
    marketId: v.id("markets"),
    outcomeId: v.id("outcomes"),
    odds: v.number(),
    status: v.union(v.literal("pending"), v.literal("won"), v.literal("lost"), v.literal("voided")),
  })
  .index("by_bet", ["betId"])
  .index("by_match", ["matchId"]),

  // Wallet Management
  wallets: defineTable({
    userId: v.id("users"),
    balance: v.number(),
    bonusBalance: v.number(),
    currency: v.string(),
    isActive: v.boolean(),
    createdAt: v.number(),
  })
  .index("by_user", ["userId"]),

  // Transactions
  transactions: defineTable({
    userId: v.id("users"),
    walletId: v.id("wallets"),
    type: v.union(
      v.literal("deposit"),
      v.literal("withdrawal"),
      v.literal("bet_placed"),
      v.literal("bet_won"),
      v.literal("bonus"),
      v.literal("cashout")
    ),
    amount: v.number(),
    balanceBefore: v.number(),
    balanceAfter: v.number(),
    status: v.union(v.literal("pending"), v.literal("completed"), v.literal("failed")),
    reference: v.optional(v.string()),
    description: v.string(),
    createdAt: v.number(),
  })
  .index("by_user", ["userId"])
  .index("by_wallet", ["walletId"])
  .index("by_type", ["type"])
  .index("by_status", ["status"]),

  // UI Configuration
  uiConfig: defineTable({
    key: v.string(),
    value: v.any(),
    section: v.string(), // "home", "sport", "match", "global"
    isActive: v.boolean(),
    updatedBy: v.id("users"),
    updatedAt: v.number(),
  })
  .index("by_key", ["key"])
  .index("by_section", ["section"]),

  // Promotions & Bonuses
  promotions: defineTable({
    name: v.string(),
    type: v.union(v.literal("deposit"), v.literal("free_bet"), v.literal("cashback")),
    description: v.string(),
    value: v.number(),
    valueType: v.union(v.literal("percentage"), v.literal("fixed")),
    minDeposit: v.optional(v.number()),
    maxBonus: v.optional(v.number()),
    wageringRequirement: v.number(),
    validDays: v.number(),
    applicableSports: v.array(v.id("sports")),
    isActive: v.boolean(),
    startDate: v.number(),
    endDate: v.number(),
    createdBy: v.id("users"),
    createdAt: v.number(),
  })
  .index("by_active", ["isActive"])
  .index("by_type", ["type"]),

  // User Bonuses
  userBonuses: defineTable({
    userId: v.id("users"),
    promotionId: v.id("promotions"),
    amount: v.number(),
    wageringRemaining: v.number(),
    status: v.union(v.literal("active"), v.literal("completed"), v.literal("expired")),
    expiresAt: v.number(),
    createdAt: v.number(),
  })
  .index("by_user", ["userId"])
  .index("by_status", ["status"]),

  // Risk Management
  riskSettings: defineTable({
    sportId: v.optional(v.id("sports")),
    leagueId: v.optional(v.id("leagues")),
    matchId: v.optional(v.id("matches")),
    maxStakePerBet: v.number(),
    maxExposurePerMatch: v.number(),
    maxExposurePerLeague: v.number(),
    autoSuspendRules: v.array(v.object({
      condition: v.string(),
      threshold: v.number(),
      action: v.string(),
    })),
    isActive: v.boolean(),
    updatedBy: v.id("users"),
    updatedAt: v.number(),
  })
  .index("by_sport", ["sportId"])
  .index("by_league", ["leagueId"])
  .index("by_match", ["matchId"]),
});