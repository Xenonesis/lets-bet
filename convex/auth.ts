import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Register new user
export const register = mutation({
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
    // Check if user already exists
    const existingUser = await ctx.db
      .query("users")
      .filter((q) => q.eq(q.field("email"), args.email))
      .first();

    if (existingUser) {
      throw new Error("User with this email already exists");
    }

    // Check if username is taken
    const existingUsername = await ctx.db
      .query("users")
      .filter((q) => q.eq(q.field("username"), args.username))
      .first();

    if (existingUsername) {
      throw new Error("Username is already taken");
    }

    // Create user
    const userId = await ctx.db.insert("users", {
      email: args.email,
      username: args.username,
      password: args.password, // In production, this should be hashed
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

    // Create wallet for user
    await ctx.db.insert("wallets", {
      userId,
      balance: 0,
      bonusBalance: 0,
      currency: "INR",
      isActive: true,
      createdAt: Date.now(),
    });

    // Get user data
    const user = await ctx.db.get(userId);
    
    // Generate JWT token (simplified for demo)
    const token = `jwt_${userId}_${Date.now()}`;

    return {
      user,
      token,
    };
  },
});

// Login user
export const login = mutation({
  args: {
    email: v.string(),
    password: v.string(),
  },
  handler: async (ctx, args) => {
    const user = await ctx.db
      .query("users")
      .filter((q) => 
        q.and(
          q.eq(q.field("email"), args.email),
          q.eq(q.field("password"), args.password) // In production, compare hashed passwords
        )
      )
      .first();

    if (!user) {
      throw new Error("Invalid email or password");
    }

    if (!user.isActive) {
      throw new Error("Account is deactivated");
    }

    // Update last login
    await ctx.db.patch(user._id, {
      lastLogin: Date.now(),
    });

    // Generate JWT token (simplified for demo)
    const token = `jwt_${user._id}_${Date.now()}`;

    return {
      user,
      token,
    };
  },
});

// Reset password
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

// Change password
export const changePassword = mutation({
  args: {
    userId: v.id("users"),
    currentPassword: v.string(),
    newPassword: v.string(),
  },
  handler: async (ctx, args) => {
    const user = await ctx.db.get(args.userId);
    
    if (!user) {
      throw new Error("User not found");
    }

    if (user.password !== args.currentPassword) {
      throw new Error("Current password is incorrect");
    }

    await ctx.db.patch(args.userId, {
      password: args.newPassword,
    });

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

    return await ctx.db.get(args.userId);
  },
});

// Request email verification
export const requestEmailVerification = mutation({
  args: {
    userId: v.id("users"),
  },
  handler: async (ctx, args) => {
    // In production, send verification email
    // For demo, just return success
    return { success: true };
  },
});