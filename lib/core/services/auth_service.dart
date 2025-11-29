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
  String? _accessToken;
  String? _refreshToken;

  User? get currentUser => _currentUser;
  String? get authToken => _accessToken;
  bool get isAuthenticated => _currentUser != null && _accessToken != null;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _accessToken = prefs.getString(AppConstants.accessTokenKey);
    _refreshToken = prefs.getString(AppConstants.refreshTokenKey);
    
    if (_accessToken != null) {
      try {
        if (!Jwt.isExpired(_accessToken!)) {
          await _loadUserFromToken();
        } else if (_refreshToken != null && !Jwt.isExpired(_refreshToken!)) {
          await _refreshAccessToken();
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
      final response = await _convexService.action<Map<String, dynamic>>(
        'auth_actions:login',
        {
          'email': email.toLowerCase(),
          'password': password,
        },
      );

      _currentUser = User.fromJson(response['user']);
      _accessToken = response['accessToken'];
      _refreshToken = response['refreshToken'];

      await _saveTokens();
      
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
      final response = await _convexService.action<Map<String, dynamic>>(
        'auth_actions:register',
        {
          'email': email.toLowerCase(),
          'username': username,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'dateOfBirth': dateOfBirth,
          'country': country,
          if (phone != null) 'phone': phone,
        },
      );

      _currentUser = User.fromJson(response['user']);
      _accessToken = response['accessToken'];
      _refreshToken = response['refreshToken'];

      await _saveTokens();
      
      return _currentUser!;
    } catch (e) {
      throw AuthException('Registration failed: $e');
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    _accessToken = null;
    _refreshToken = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.accessTokenKey);
    await prefs.remove(AppConstants.refreshTokenKey);
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

      await _convexService.action<Map<String, dynamic>>(
        'auth_actions:changePassword',
        {
          'userId': _currentUser!.id,
          'currentPassword': currentPassword,
          'newPassword': newPassword,
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

  Future<void> _refreshAccessToken() async {
    if (_refreshToken == null) return;

    try {
      final response = await _convexService.action<Map<String, dynamic>>(
        'auth_actions:refreshToken',
        {'refreshToken': _refreshToken},
      );

      _accessToken = response['accessToken'];
      await _saveTokens();
    } catch (e) {
      await logout();
      throw AuthException('Token refresh failed: $e');
    }
  }

  Future<void> _saveTokens() async {
    final prefs = await SharedPreferences.getInstance();
    if (_accessToken != null) {
      await prefs.setString(AppConstants.accessTokenKey, _accessToken!);
    }
    if (_refreshToken != null) {
      await prefs.setString(AppConstants.refreshTokenKey, _refreshToken!);
    }
  }

  Future<void> _loadUserFromToken() async {
    if (_accessToken == null) return;

    try {
      final payload = Jwt.parseJwt(_accessToken!);
      final userId = payload['userId'];
      
      // Query user from Convex
      final userData = await _convexService.query<Map<String, dynamic>>(
        'users:getById',
        {'userId': userId},
      );
      
      _currentUser = User.fromJson(userData);
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