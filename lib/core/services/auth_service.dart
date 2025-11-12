import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../constants/app_constants.dart';
import '../models/user.dart';
import 'convex_service.dart';
import 'mock_data_service.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final ConvexService _convexService = ConvexService();
  final MockDataService _mockService = MockDataService();
  User? _currentUser;
  String? _authToken;

  User? get currentUser => _currentUser;
  String? get authToken => _authToken;
  bool get isAuthenticated => _currentUser != null && _authToken != null;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _authToken = prefs.getString(AppConstants.userTokenKey);
    
    if (_authToken != null) {
      try {
        if (!Jwt.isExpired(_authToken!)) {
          await _loadUserFromToken();
        } else {
          await logout();
        }
      } catch (e) {
        await logout();
      }
    }
  }

  Future<User> login(String email, String password) async {
    try {
      // Using mock service for now
      _currentUser = await _mockService.login(email, password);
      _authToken = 'mock_token_${_currentUser!.id}_${DateTime.now().millisecondsSinceEpoch}';

      await _saveAuthToken(_authToken!);
      
      return _currentUser!;
    } catch (e) {
      throw AuthException('Login failed: $e');
    }
  }

  Future<User> register({
    required String email,
    required String username,
    required String password,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String country,
    String? phone,
  }) async {
    try {
      // Using mock service for now
      _currentUser = await _mockService.register(
        email: email,
        username: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        country: country,
      );
      _authToken = 'mock_token_${_currentUser!.id}_${DateTime.now().millisecondsSinceEpoch}';

      await _saveAuthToken(_authToken!);
      
      return _currentUser!;
    } catch (e) {
      throw AuthException('Registration failed: $e');
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    _authToken = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.userTokenKey);
  }

  Future<void> resetPassword(String email) async {
    try {
      await _convexService.mutation<Map<String, dynamic>>(
        'auth:resetPassword',
        {'email': email.toLowerCase()},
      );
    } catch (e) {
      throw AuthException('Password reset failed: $e');
    }
  }

  Future<User> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    String? country,
  }) async {
    try {
      if (_currentUser == null) {
        throw AuthException('User not authenticated');
      }

      final response = await _convexService.mutation<Map<String, dynamic>>(
        'users:updateProfile',
        {
          'userId': _currentUser!.id,
          if (firstName != null) 'firstName': firstName,
          if (lastName != null) 'lastName': lastName,
          if (phone != null) 'phone': phone,
          if (country != null) 'country': country,
        },
      );

      _currentUser = User.fromJson(response);
      return _currentUser!;
    } catch (e) {
      throw AuthException('Profile update failed: $e');
    }
  }

  Future<void> changePassword(String currentPassword, String newPassword) async {
    try {
      if (_currentUser == null) {
        throw AuthException('User not authenticated');
      }

      final currentHashedPassword = _hashPassword(currentPassword);
      final newHashedPassword = _hashPassword(newPassword);

      await _convexService.mutation<Map<String, dynamic>>(
        'auth:changePassword',
        {
          'userId': _currentUser!.id,
          'currentPassword': currentHashedPassword,
          'newPassword': newHashedPassword,
        },
      );
    } catch (e) {
      throw AuthException('Password change failed: $e');
    }
  }

  Future<void> verifyEmail(String verificationCode) async {
    try {
      if (_currentUser == null) {
        throw AuthException('User not authenticated');
      }

      final response = await _convexService.mutation<Map<String, dynamic>>(
        'auth:verifyEmail',
        {
          'userId': _currentUser!.id,
          'verificationCode': verificationCode,
        },
      );

      _currentUser = User.fromJson(response);
    } catch (e) {
      throw AuthException('Email verification failed: $e');
    }
  }

  Future<void> requestEmailVerification() async {
    try {
      if (_currentUser == null) {
        throw AuthException('User not authenticated');
      }

      await _convexService.mutation<Map<String, dynamic>>(
        'auth:requestEmailVerification',
        {'userId': _currentUser!.id},
      );
    } catch (e) {
      throw AuthException('Email verification request failed: $e');
    }
  }

  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> _saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userTokenKey, token);
  }

  Future<void> _loadUserFromToken() async {
    if (_authToken == null) return;

    try {
      // For mock data, just load the default test user
      if (_authToken!.startsWith('mock_token_')) {
        _currentUser = MockDataService.mockUser;
      }
    } catch (e) {
      throw AuthException('Failed to load user: $e');
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => 'AuthException: $message';
}