import { mutation, query } from "./_generated/server";
import { v } from "convex/values";

// Get user by ID
export const getById = query({
  args: { userId: v.id("users") },
  handler: async (ctx, args) => {
    const user = await ctx.db.get(args.userId);
    if (!user) {
      return null;
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

// Update user profile
export const updateProfile = mutation({
  args: {
    userId: v.id("users"),
    firstName: v.optional(v.string()),
    lastName: v.optional(v.string()),
    phone: v.optional(v.string()),
    country: v.optional(v.string()),
  },
  handler: async (ctx, args) => {
    const { userId, ...updates } = args;
    
    // Remove undefined values
    const cleanUpdates = Object.fromEntries(
      Object.entries(updates).filter(([_, value]) => value !== undefined)
    );
    
    await ctx.db.patch(userId, cleanUpdates);
    const user = await ctx.db.get(userId);
    
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

// Update KYC status (Admin only)
export const updateKycStatus = mutation({
  args: {
    userId: v.id("users"),
    kycStatus: v.union(v.literal("pending"), v.literal("approved"), v.literal("rejected")),
    updatedBy: v.id("users"),
  },
  handler: async (ctx, args) => {
    // Verify admin permissions
    const admin = await ctx.db.get(args.updatedBy);
    if (!admin || admin.role !== "admin") {
      throw new Error("Insufficient permissions");
    }

    await ctx.db.patch(args.userId, {
      kycStatus: args.kycStatus,
    });

    return await ctx.db.get(args.userId);
  },
});

// Get all users (Admin only)
export const list = query({
  args: {
    adminId: v.id("users"),
    limit: v.optional(v.number()),
    role: v.optional(v.union(v.literal("user"), v.literal("admin"), v.literal("risk_manager"))),
  },
  handler: async (ctx, args) => {
    // Verify admin permissions
    const admin = await ctx.db.get(args.adminId);
    if (!admin || admin.role !== "admin") {
      throw new Error("Insufficient permissions");
    }

    let query = ctx.db.query("users");

    if (args.role) {
      query = query.filter((q) => q.eq(q.field("role"), args.role));
    }

    query = query.order("desc");

    if (args.limit) {
      query = query.take(args.limit);
    }

    return await query.collect();
  },
});

// Deactivate user (Admin only)
export const deactivate = mutation({
  args: {
    userId: v.id("users"),
    adminId: v.id("users"),
    reason: v.string(),
  },
  handler: async (ctx, args) => {
    // Verify admin permissions
    const admin = await ctx.db.get(args.adminId);
    if (!admin || admin.role !== "admin") {
      throw new Error("Insufficient permissions");
    }

    await ctx.db.patch(args.userId, {
      isActive: false,
    });

    return await ctx.db.get(args.userId);
  },
});

// Activate user (Admin only)
export const activate = mutation({
  args: {
    userId: v.id("users"),
    adminId: v.id("users"),
  },
  handler: async (ctx, args) => {
    // Verify admin permissions
    const admin = await ctx.db.get(args.adminId);
    if (!admin || admin.role !== "admin") {
      throw new Error("Insufficient permissions");
    }

    await ctx.db.patch(args.userId, {
      isActive: true,
    });

    return await ctx.db.get(args.userId);
  },
});