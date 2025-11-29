"use node";

import { action } from "./_generated/server";
import { api } from "./_generated/api";
import { v } from "convex/values";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

const JWT_SECRET = process.env.CONVEX_JWT_SECRET || "default_secret_change_in_prod";
const JWT_EXPIRES_IN = "1h";
const REFRESH_TOKEN_EXPIRES_IN = "7d";

// Register new user
export const register = action({
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
    const existingUser = await ctx.runQuery(api.auth.getUserByEmail, {
      email: args.email
    });

    if (existingUser) {
      throw new Error("User with this email already exists");
    }

    // Check if username is taken
    const existingUsername = await ctx.runQuery(api.auth.getUserByUsername, {
      username: args.username
    });

    if (existingUsername) {
      throw new Error("Username is already taken");
    }

    // Hash password
    const hashedPassword = await bcrypt.hash(args.password, 12);

    // Create user
    const user = await ctx.runMutation(api.auth.createUser, {
      email: args.email,
      username: args.username,
      password: hashedPassword,
      firstName: args.firstName,
      lastName: args.lastName,
      phone: args.phone,
      dateOfBirth: args.dateOfBirth,
      country: args.country,
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
    await ctx.runMutation(api.auth.updateUserLoginAttempts, {
      userId: user._id,
      refreshToken,
    });

    // Format user for Flutter app
    const formattedUser = {
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

    return {
      user: formattedUser,
      accessToken,
      refreshToken,
    };
  },
});

// Login user
export const login = action({
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

    const user = await ctx.runQuery(api.auth.getUserByEmail, {
      email: args.email
    });

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
      await ctx.runMutation(api.auth.updateUserLoginAttempts, {
        userId: user._id,
        failedAttempts: attempts + 1,
        lastFailed: Date.now(),
      });
      throw new Error("Invalid email or password");
    }

    if (!user.isActive) {
      throw new Error("Account is deactivated");
    }

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

    // Reset failed attempts and store refresh token on successful login
    await ctx.runMutation(api.auth.updateUserLoginAttempts, {
      userId: user._id,
      failedAttempts: 0,
      lastLogin: Date.now(),
      refreshToken,
    });

    // Format user for Flutter app
    const formattedUser = {
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
      lastLogin: new Date(Date.now()).toISOString(),
    };

    return {
      user: formattedUser,
      accessToken,
      refreshToken,
    };
  },
});

// Change password
export const changePassword = action({
  args: {
    userId: v.id("users"),
    currentPassword: v.string(),
    newPassword: v.string(),
  },
  handler: async (ctx, args) => {
    const user = await ctx.runQuery(api.auth.getUserById, {
      userId: args.userId
    });
    
    if (!user) {
      throw new Error("User not found");
    }

    const isCurrentPasswordValid = await bcrypt.compare(args.currentPassword, user.password);
    if (!isCurrentPasswordValid) {
      throw new Error("Current password is incorrect");
    }

    const hashedNewPassword = await bcrypt.hash(args.newPassword, 12);
    await ctx.runMutation(api.auth.updateUserPassword, {
      userId: args.userId,
      password: hashedNewPassword,
    });

    return { success: true };
  },
});

// Refresh access token
export const refreshToken = action({
  args: {
    refreshToken: v.string(),
  },
  handler: async (ctx, args) => {
    try {
      const decoded = jwt.verify(args.refreshToken, JWT_SECRET) as { userId: string };
      const user = await ctx.runQuery(api.auth.getUserById, {
        userId: decoded.userId
      });

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