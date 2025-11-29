# Flutter Integration Guide

## Quick Start

Your Flutter app is already configured to work with Convex! Here's what you need to know:

## Authentication Flow

### 1. Register a New User

```dart
try {
  final user = await AuthService().register(
    email: 'user@example.com',
    username: 'username',
    password: 'Password123!',
    firstName: 'John',
    lastName: 'Doe',
    dateOfBirth: '1990-01-01',
    country: 'India',
    phone: '+919876543210', // optional
  );
  
  // User is automatically logged in after registration
  print('Registered: ${user.email}');
} catch (e) {
  print('Registration failed: $e');
}
```

### 2. Login

```dart
try {
  final user = await AuthService().login(
    'user@example.com',
    'Password123!',
  );
  
  print('Logged in: ${user.email}');
} catch (e) {
  print('Login failed: $e');
}
```

### 3. Check Authentication Status

```dart
final authService = AuthService();

if (authService.isAuthenticated) {
  final user = authService.currentUser;
  print('Current user: ${user?.email}');
} else {
  // Redirect to login
}
```

### 4. Logout

```dart
await AuthService().logout();
```

## Common Operations

### Get User Wallet

```dart
final convex = ConvexService();
final userId = AuthService().currentUser?.id;

final wallet = await convex.query<Map<String, dynamic>>(
  'wallets:getByUser',
  {'userId': userId},
);

print('Balance: ${wallet['balance']}');
print('Currency: ${wallet['currency']}');
```

### List Sports

```dart
final sports = await convex.query<List<Map<String, dynamic>>>(
  'sports:list',
  {},
);

for (var sport in sports) {
  print('${sport['name']} - ${sport['code']}');
}
```

### Get Live Matches

```dart
final matches = await convex.query<List<Map<String, dynamic>>>(
  'matches:getLive',
  {'limit': 10},
);

for (var match in matches) {
  print('${match['homeTeam']} vs ${match['awayTeam']}');
}
```

### Get Featured Matches

```dart
final matches = await convex.query<List<Map<String, dynamic>>>(
  'matches:getFeatured',
  {'limit': 5},
);
```

### Get Upcoming Matches

```dart
final matches = await convex.query<List<Map<String, dynamic>>>(
  'matches:getUpcoming',
  {
    'limit': 20,
    // Optional: filter by sport
    // 'sportId': sportId,
  },
);
```

### Update User Profile

```dart
final updatedUser = await AuthService().updateProfile(
  firstName: 'Jane',
  phone: '+919999999999',
);

print('Updated: ${updatedUser.firstName}');
```

### Change Password

```dart
try {
  await AuthService().changePassword(
    'currentPassword',
    'newPassword123!',
  );
  print('Password changed successfully');
} catch (e) {
  print('Password change failed: $e');
}
```

## Error Handling

All Convex operations can throw exceptions. Always wrap them in try-catch:

```dart
try {
  final result = await convex.query('some:function', {});
} on ConvexException catch (e) {
  print('Convex error: ${e.message}');
} on AuthException catch (e) {
  print('Auth error: ${e.message}');
} catch (e) {
  print('Unknown error: $e');
}
```

## Common Error Messages

- `"User with this email already exists"` - Email is taken
- `"Username is already taken"` - Username is taken
- `"Invalid email or password"` - Login credentials are wrong
- `"Account temporarily locked..."` - Too many failed login attempts (wait 15 minutes)
- `"Password must be at least 8 characters long"` - Password too short
- `"Invalid email format"` - Email format is invalid

## User Model

The User model has these fields:

```dart
class User {
  final String id;
  final String email;
  final String username;
  final String firstName;
  final String lastName;
  final String? phone;
  final String dateOfBirth;
  final String country;
  final bool isVerified;
  final KycStatus kycStatus;  // pending, approved, rejected
  final bool isActive;
  final UserRole role;  // user, admin, risk_manager
  final DateTime createdAt;
  final DateTime? lastLogin;
}
```

## Wallet Model

```dart
class Wallet {
  final String id;
  final String userId;
  final double balance;
  final double bonusBalance;
  final String currency;
  final bool isActive;
  final DateTime createdAt;
}
```

## Testing Your Integration

1. **Start your Flutter app**:
   ```bash
   flutter run
   ```

2. **Try registering a new user** through your UI

3. **Check if the wallet was created**:
   - Login with the new user
   - Navigate to wallet/profile screen
   - Verify balance shows 0

4. **Test login/logout flow**

## Debugging

### Check Convex Logs

```bash
npx convex logs
```

### Verify Environment Variables

Make sure your Flutter app has the correct Convex URL:

```dart
// In lib/main.dart or wherever you initialize ConvexService
ConvexService().initialize(
  convexUrl: 'https://brainy-frog-582.convex.cloud',
  apiKey: '', // Not needed for public functions
);
```

### Common Issues

**Issue**: "Connection refused" or timeout errors
**Solution**: Check your internet connection and verify the Convex URL

**Issue**: "Function not found"
**Solution**: Make sure you've deployed your Convex functions: `npx convex dev`

**Issue**: Token expired
**Solution**: The app should automatically refresh tokens, but you can manually logout and login again

## Real-time Updates (Coming Soon)

Convex supports real-time subscriptions. Example:

```dart
// Subscribe to live odds updates
final stream = convex.subscribe<List<Map<String, dynamic>>>(
  'odds:subscribeLive',
  {'matchId': matchId},
);

stream.listen((odds) {
  // Update UI with new odds
  print('Odds updated: $odds');
});
```

## Best Practices

1. **Always check authentication** before making user-specific queries
2. **Handle errors gracefully** - show user-friendly messages
3. **Cache data** when appropriate to reduce API calls
4. **Use loading states** while waiting for Convex responses
5. **Logout on 401 errors** - token might be invalid

## Need Help?

- Check `CONVEX_SETUP_COMPLETE.md` for backend details
- Run `node test_all_features.js` to verify backend is working
- Check Convex dashboard: https://dashboard.convex.dev

---

**Happy Coding!** 🚀
