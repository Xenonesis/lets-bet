import { mutation } from "./_generated/server";

// Initialize database with sample data
export const initializeData = mutation({
  args: {},
  handler: async (ctx) => {
    // Check if data already exists
    const existingSports = await ctx.db.query("sports").first();
    if (existingSports) {
      return { message: "Data already initialized" };
    }

    // Create admin user
    const adminUserId = await ctx.db.insert("users", {
      email: "admin@sportsbet.com",
      username: "admin",
      password: "admin123", // In production, this should be hashed
      firstName: "Admin",
      lastName: "User",
      dateOfBirth: "1990-01-01",
      country: "India",
      isVerified: true,
      kycStatus: "approved",
      isActive: true,
      role: "admin",
      createdAt: Date.now(),
    });

    // Create regular test user
    const testUserId = await ctx.db.insert("users", {
      email: "test@user.com",
      username: "testuser",
      password: "test123",
      firstName: "Test",
      lastName: "User",
      dateOfBirth: "1995-01-01",
      country: "India",
      isVerified: true,
      kycStatus: "approved",
      isActive: true,
      role: "user",
      createdAt: Date.now(),
    });

    // Create wallet for test user
    await ctx.db.insert("wallets", {
      userId: testUserId,
      balance: 1000.0,
      bonusBalance: 100.0,
      currency: "INR",
      isActive: true,
      createdAt: Date.now(),
    });

    // Create Sports
    const footballId = await ctx.db.insert("sports", {
      name: "Football",
      code: "football",
      icon: "⚽",
      themeColor: "#4CAF50",
      displayOrder: 1,
      isActive: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    const cricketId = await ctx.db.insert("sports", {
      name: "Cricket",
      code: "cricket",
      icon: "🏏",
      themeColor: "#FF9800",
      displayOrder: 2,
      isActive: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    const basketballId = await ctx.db.insert("sports", {
      name: "Basketball",
      code: "basketball",
      icon: "🏀",
      themeColor: "#F44336",
      displayOrder: 3,
      isActive: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    const tennisId = await ctx.db.insert("sports", {
      name: "Tennis",
      code: "tennis",
      icon: "🎾",
      themeColor: "#2196F3",
      displayOrder: 4,
      isActive: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    // Create Leagues
    const premierLeagueId = await ctx.db.insert("leagues", {
      sportId: footballId,
      name: "Premier League",
      code: "EPL",
      logo: "https://logos-world.net/wp-content/uploads/2020/06/Premier-League-Logo.png",
      country: "England",
      isActive: true,
      displayOrder: 1,
      seasonStart: "2024-08-01",
      seasonEnd: "2025-05-31",
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    const ihlId = await ctx.db.insert("leagues", {
      sportId: cricketId,
      name: "Indian Premier League",
      code: "IPL",
      logo: "https://1000logos.net/wp-content/uploads/2021/03/IPL-logo.png",
      country: "India",
      isActive: true,
      displayOrder: 1,
      seasonStart: "2024-03-01",
      seasonEnd: "2024-06-30",
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    // Create sample matches
    const now = Date.now();
    const oneHour = 60 * 60 * 1000;

    // Live match
    const liveMatchId = await ctx.db.insert("matches", {
      sportId: footballId,
      leagueId: premierLeagueId,
      homeTeam: "Manchester United",
      awayTeam: "Liverpool",
      startTime: now - oneHour,
      status: "live",
      score: { home: 1, away: 2 },
      liveStats: {
        minute: 67,
        period: "2nd Half",
        possession: { home: 45, away: 55 },
        corners: { home: 3, away: 5 },
        cards: { home: 2, away: 1 },
      },
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    // Upcoming matches
    const arsenalChelseaMatchId = await ctx.db.insert("matches", {
      sportId: footballId,
      leagueId: premierLeagueId,
      homeTeam: "Arsenal",
      awayTeam: "Chelsea",
      startTime: now + (2 * oneHour),
      status: "scheduled",
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    const mumbaiChennaiMatchId = await ctx.db.insert("matches", {
      sportId: cricketId,
      leagueId: ihlId,
      homeTeam: "Mumbai Indians",
      awayTeam: "Chennai Super Kings",
      startTime: now + (4 * oneHour),
      status: "scheduled",
      isPreMatchEnabled: true,
      isLiveEnabled: true,
      isFeatured: true,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    // Create Markets for live match
    const matchWinnerMarketId = await ctx.db.insert("markets", {
      matchId: liveMatchId,
      name: "Match Winner",
      type: "match_winner",
      description: "Select the winner of the match",
      category: "Main",
      displayOrder: 1,
      isActive: true,
      isSuspended: false,
      maxStake: 10000,
      minStake: 1,
      margin: 5,
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    // Create Outcomes
    await ctx.db.insert("outcomes", {
      marketId: matchWinnerMarketId,
      name: "Manchester United",
      odds: 3.20,
      isActive: true,
      isSuspended: false,
      displayOrder: 1,
      updatedAt: Date.now(),
    });

    await ctx.db.insert("outcomes", {
      marketId: matchWinnerMarketId,
      name: "Draw",
      odds: 3.40,
      isActive: true,
      isSuspended: false,
      displayOrder: 2,
      updatedAt: Date.now(),
    });

    await ctx.db.insert("outcomes", {
      marketId: matchWinnerMarketId,
      name: "Liverpool",
      odds: 2.10,
      isActive: true,
      isSuspended: false,
      displayOrder: 3,
      updatedAt: Date.now(),
    });

    // Create a sample promotion
    await ctx.db.insert("promotions", {
      name: "Welcome Bonus",
      type: "deposit",
      description: "Get 100% bonus up to ₹10,000 on your first deposit",
      value: 100,
      valueType: "percentage",
      minDeposit: 100,
      maxBonus: 10000,
      wageringRequirement: 5,
      validDays: 30,
      applicableSports: [footballId, cricketId, basketballId, tennisId],
      isActive: true,
      startDate: Date.now(),
      endDate: Date.now() + (30 * 24 * 60 * 60 * 1000),
      createdBy: adminUserId,
      createdAt: Date.now(),
    });

    return {
      message: "Database initialized successfully",
      data: {
        adminUserId,
        testUserId,
        sportsCount: 4,
        leaguesCount: 2,
        matchesCount: 3,
        marketsCount: 1,
        outcomesCount: 3,
      }
    };
  },
});
