import { mutation, query } from "./_generated/server";
import { v } from "convex/values";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

const JWT_SECRET = process.env.CONVEX_JWT_SECRET || "default_secret_change_in_prod";
const JWT_EXPIRES_IN = "1h";
const REFRESH_TOKEN_EXPIRES_IN = "7d";

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
    // Input validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(args.email)) {
      throw new Error("Invalid email format");
    }
    
    if (args.password.length < 8) {
      throw new Error("Password must be at least 8 characters long");
    }
    
    if (args.username.length < 3) {
      throw new Error("Username must be at least 3 characters long");
    }
    
    if (args.firstName.length < 1 || args.lastName.length < 1) {
      throw new Error("First and last name are required");
    }
    
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

    // Hash password
    const hashedPassword = await bcrypt.hash(args.password, 12);

    // Create user
    const userId = await ctx.db.insert("users", {
      email: args.email,
      username: args.username,
      password: hashedPassword,
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
    
    // Generate JWT tokens
    const accessToken = jwt.sign(
      { userId: user._id, email: user.email },
      JWT_SECRET,
      { expiresIn: JWT_EXPIRES_IN }
    );
    const refreshToken = jwt.sign(
      { userId: user._id },
      JWT_SECRET,
      { expiresIn: REFRESH_TOKEN_EXPIRES_IN }
    );

    // Store refresh token in user
    await ctx.db.patch(user._id, { refreshToken });

    return {
      user,
      accessToken,
      refreshToken,
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
    // Input validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(args.email)) {
      throw new Error("Invalid email format");
    }
    
    if (args.password.length < 1) {
      throw new Error("Password is required");
    }

    const user = await ctx.db
      .query("users")
      .filter((q) => q.eq(q.field("email"), args.email))
      .first();

    if (!user) {
      throw new Error("Invalid email or password");
    }

    // Rate limiting: check failed attempts
    const maxAttempts = 5;
    const lockoutTime = 15 * 60 * 1000; // 15 minutes
    const attempts = user.failedLoginAttempts || 0;
    const lastFailed = user.lastFailedLogin || 0;
    
    if (attempts >= maxAttempts && Date.now() - lastFailed < lockoutTime) {
      throw new Error("Account temporarily locked due to too many failed login attempts. Try again later.");
    }

    // Compare password with hashed
    const isPasswordValid = await bcrypt.compare(args.password, user.password);
    if (!isPasswordValid) {
      // Increment failed attempts
      await ctx.db.patch(user._id, {
        failedLoginAttempts: attempts + 1,
        lastFailedLogin: Date.now(),
      });
      throw new Error("Invalid email or password");
    }

    if (!user.isActive) {
      throw new Error("Account is deactivated");
    }

    // Reset failed attempts on successful login
    await ctx.db.patch(user._id, {
      failedLoginAttempts: 0,
      lastFailedLogin: null,
      lastLogin: Date.now(),
    });

    // Generate JWT tokens
    const accessToken = jwt.sign(
      { userId: user._id, email: user.email },
      JWT_SECRET,
      { expiresIn: JWT_EXPIRES_IN }
    );
    const refreshToken = jwt.sign(
      { userId: user._id },
      JWT_SECRET,
      { expiresIn: REFRESH_TOKEN_EXPIRES_IN }
    );

    // Store refresh token in user
    await ctx.db.patch(user._id, { refreshToken });

    return {
      user,
      accessToken,
      refreshToken,
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

    const isCurrentPasswordValid = await bcrypt.compare(args.currentPassword, user.password);
    if (!isCurrentPasswordValid) {
      throw new Error("Current password is incorrect");
    }

    const hashedNewPassword = await bcrypt.hash(args.newPassword, 12);
    await ctx.db.patch(args.userId, {
      password: hashedNewPassword,
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

// Refresh access token
export const refreshToken = mutation({
  args: {
    refreshToken: v.string(),
  },
  handler: async (ctx, args) => {
    try {
      const decoded = jwt.verify(args.refreshToken, JWT_SECRET) as { userId: string };
      const user = await ctx.db.get(decoded.userId);

      if (!user || user.refreshToken !== args.refreshToken) {
        throw new Error("Invalid refresh token");
      }

      const accessToken = jwt.sign(
        { userId: user._id, email: user.email },
        JWT_SECRET,
        { expiresIn: JWT_EXPIRES_IN }
      );

      return { accessToken };
    } catch (error) {
      throw new Error("Invalid refresh token");
    }
  },
});