import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Internal database operations (mutations without Node.js APIs)
export const getUserByEmail = query({
  args: { email: v.string() },
  handler: async (ctx, args) => {
    return await ctx.db
      .query("users")
      .filter((q) => q.eq(q.field("email"), args.email))
      .first();
  },
});

export const getUserByUsername = query({
  args: { username: v.string() },
  handler: async (ctx, args) => {
    return await ctx.db
      .query("users")
      .filter((q) => q.eq(q.field("username"), args.username))
      .first();
  },
});

export const getUserById = query({
  args: { userId: v.id("users") },
  handler: async (ctx, args) => {
    return await ctx.db.get(args.userId);
  },
});

export const createUser = mutation({
  args: {
    email: v.string(),
    username: v.string(),
    password: v.string(),
    firstName: v.string(),
    lastName: v.string(),
    phone: v.optional(v.string()),
    dateOfBirth: v.string(),
    country: v.string(),
  },
  handler: async (ctx, args) => {
    const userId = await ctx.db.insert("users", {
      email: args.email,
      username: args.username,
      password: args.password,
      firstName: args.firstName,
      lastName: args.lastName,
      phone: args.phone,
      dateOfBirth: args.dateOfBirth,
      country: args.country,
      isVerified: false,
      kycStatus: "pending",
      isActive: true,
      role: "user",
      createdAt: Date.now(),
    });

    await ctx.db.insert("wallets", {
      userId,
      balance: 0,
      bonusBalance: 0,
      currency: "INR",
      isActive: true,
      createdAt: Date.now(),
    });

    const user = await ctx.db.get(userId);
    if (!user) {
      throw new Error("Failed to create user");
    }

    return user;
  },
});

export const updateUserLoginAttempts = mutation({
  args: {
    userId: v.id("users"),
    failedAttempts: v.optional(v.number()),
    lastFailed: v.optional(v.number()),
    lastLogin: v.optional(v.number()),
    refreshToken: v.optional(v.string()),
  },
  handler: async (ctx, args) => {
    const updates: any = {};
    if (args.failedAttempts !== undefined) updates.failedLoginAttempts = args.failedAttempts;
    if (args.lastFailed !== undefined) updates.lastFailedLogin = args.lastFailed;
    if (args.lastLogin !== undefined) updates.lastLogin = args.lastLogin;
    if (args.refreshToken !== undefined) updates.refreshToken = args.refreshToken;

    await ctx.db.patch(args.userId, updates);
  },
});

export const updateUserPassword = mutation({
  args: {
    userId: v.id("users"),
    password: v.string(),
  },
  handler: async (ctx, args) => {
    await ctx.db.patch(args.userId, { password: args.password });
  },
});

export const updateUserVerification = mutation({
  args: {
    userId: v.id("users"),
    isVerified: v.boolean(),
  },
  handler: async (ctx, args) => {
    await ctx.db.patch(args.userId, { isVerified: args.isVerified });
    return await ctx.db.get(args.userId);
  },
});

// Reset password (simple mutation without bcrypt)
export const resetPassword = mutation({
  args: {
    email: v.string(),
  },
  handler: async (ctx, args) => {
    const user = await ctx.db
      .query("users")
      .filter((q) => q.eq(q.field("email"), args.email))
      .first();

    if (!user) {
      throw new Error("No user found with this email");
    }

    // In production, send actual reset email
    // For demo, just return success
    return { success: true };
  },
});

// Verify email
export const verifyEmail = mutation({
  args: {
    userId: v.id("users"),
    verificationCode: v.string(),
  },
  handler: async (ctx, args) => {
    // In production, verify the actual code
    // For demo, just mark as verified
    await ctx.db.patch(args.userId, {
      isVerified: true,
    });
    const user = await ctx.db.get(args.userId);
    
    if (!user) {
      throw new Error("User not found");
    }
    
    // Format for Flutter app
    return {
      id: user._id,
      email: user.email,
      username: user.username,
      firstName: user.firstName,
      lastName: user.lastName,
      phone: user.phone,
      dateOfBirth: user.dateOfBirth,
      country: user.country,
      isVerified: user.isVerified,
      kycStatus: user.kycStatus,
      isActive: user.isActive,
      role: user.role,
      createdAt: new Date(user.createdAt).toISOString(),
      lastLogin: user.lastLogin ? new Date(user.lastLogin).toISOString() : null,
    };
  },
});