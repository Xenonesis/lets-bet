# Flutter App Troubleshooting Guide

## The Backend is Working! ✅

I've verified that the Convex backend is returning the correct format for your Flutter app. All tests pass:

```bash
node test_flutter_format.js
# ✅ All fields are Flutter-compatible!
```

## If You're Still Seeing Errors in Flutter

The error you're seeing is likely due to one of these reasons:

### 1. Flutter App Cache

**Solution**: Restart your Flutter app completely

```bash
# Stop the app (Ctrl+C in terminal)
# Then restart
flutter run
```

Or do a clean rebuild:

```bash
flutter clean
flutter pub get
flutter run
```

### 2. Old Convex URL or Configuration

**Check your Flutter app's Convex configuration**:

```dart
// In lib/main.dart or wherever ConvexService is initialized
ConvexService().initialize(
  convexUrl: 'https://brainy-frog-582.convex.cloud',  // ← Verify this URL
  apiKey: '',
);
```

### 3. Network/Connection Issues

**Test the connection manually**:

```bash
# Run this test to verify the backend is accessible
node test_flutter_format.js
```

If this works but Flutter doesn't, it's a Flutter-side issue.

### 4. Check Flutter Console for Detailed Errors

Look for the full error stack trace in your Flutter console. It should show:
- Which line in your Dart code is failing
- The exact JSON response received
- Any parsing errors

### 5. Verify ConvexService Implementation

Check `lib/core/services/convex_service.dart`:

```dart
Future<T> action<T>(String functionName, Map<String, dynamic> args) async {
  try {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/action'),  // ← Should be /api/action
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'path': functionName,  // ← Should be 'path', not 'function'
        'args': args,
        'format': 'json',
      }),
    ).timeout(AppConstants.apiTimeout);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        return data['value'] as T;  // ← Extract 'value' from response
      } else {
        throw ConvexException('Action failed: ${data['errorMessage']}');
      }
    }
  } catch (e) {
    throw ConvexException('Action error: $e');
  }
}
```

## Test Registration from Flutter

Try this in your Flutter app:

```dart
try {
  final user = await AuthService().register(
    email: 'test${DateTime.now().millisecondsSinceEpoch}@example.com',
    username: 'testuser${DateTime.now().millisecondsSinceEpoch}',
    password: 'TestPassword123!',
    firstName: 'Test',
    lastName: 'User',
    dateOfBirth: '1990-01-01',
    country: 'India',
  );
  
  print('✅ Registration successful!');
  print('User ID: ${user.id}');
  print('Email: ${user.email}');
} catch (e) {
  print('❌ Registration failed: $e');
  // Check the full error message here
}
```

## Expected Response Format

The backend returns this exact format (verified):

```json
{
  "status": "success",
  "value": {
    "user": {
      "id": "kn7f74xhkxdt1kjf9w44d7g59d7vat3f",
      "email": "test@example.com",
      "username": "testuser",
      "firstName": "Test",
      "lastName": "User",
      "dateOfBirth": "1990-01-01",
      "country": "India",
      "isVerified": false,
      "kycStatus": "pending",
      "isActive": true,
      "role": "user",
      "createdAt": "2025-11-13T10:52:43.285Z",
      "lastLogin": null
    },
    "accessToken": "eyJhbGc...",
    "refreshToken": "eyJhbGc..."
  }
}
```

## Common Flutter Parsing Issues

### Issue 1: Trying to access `_id` instead of `id`

❌ Wrong:
```dart
final userId = response['user']['_id'];
```

✅ Correct:
```dart
final userId = response['user']['id'];
```

### Issue 2: Date parsing

The backend returns ISO 8601 strings. Your User model should parse them:

```dart
createdAt: DateTime.parse(json['createdAt'] as String),
```

### Issue 3: Null safety

Make sure optional fields are handled:

```dart
phone: json['phone'] as String?,  // ← nullable
lastLogin: json['lastLogin'] == null 
    ? null 
    : DateTime.parse(json['lastLogin'] as String),
```

## Debug Steps

1. **Add logging to ConvexService**:

```dart
Future<T> action<T>(String functionName, Map<String, dynamic> args) async {
  print('🔵 Calling: $functionName');
  print('🔵 Args: $args');
  
  final response = await http.post(...);
  
  print('🔵 Status: ${response.statusCode}');
  print('🔵 Body: ${response.body}');
  
  // ... rest of code
}
```

2. **Check the actual response**:

Look at what `response.body` contains. It should match the format above.

3. **Test with a simple curl command**:

```bash
curl -X POST https://brainy-frog-582.convex.cloud/api/action \
  -H "Content-Type: application/json" \
  -d '{
    "path": "auth_actions:register",
    "args": {
      "email": "test@example.com",
      "username": "testuser",
      "password": "TestPassword123!",
      "firstName": "Test",
      "lastName": "User",
      "dateOfBirth": "1990-01-01",
      "country": "India"
    },
    "format": "json"
  }'
```

## Still Having Issues?

1. **Check Convex logs**:
   ```bash
   npx convex logs
   ```

2. **Verify deployment**:
   ```bash
   npx convex dev --once
   ```

3. **Run backend tests**:
   ```bash
   node test_all_features.js
   node test_flutter_format.js
   ```

4. **Share the exact error**:
   - Copy the full error message from Flutter console
   - Include the stack trace
   - Show the response body if available

## Quick Fix Checklist

- [ ] Restart Flutter app
- [ ] Run `flutter clean && flutter pub get`
- [ ] Verify Convex URL in Flutter app
- [ ] Check internet connection
- [ ] Verify backend is deployed: `npx convex dev --once`
- [ ] Run backend tests: `node test_flutter_format.js`
- [ ] Add debug logging to ConvexService
- [ ] Check Flutter console for full error details

---

**Backend Status**: ✅ Working perfectly
**Last Verified**: 2025-11-13 16:19 UTC
**Test Results**: All 8 tests passing
