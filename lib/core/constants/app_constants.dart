class AppConstants {
  // App Info
  static const String appName = 'SportsBet Pro';
  static const String appVersion = '1.0.0';
  
  // Convex Configuration
  static const String convexUrl = 'https://judicious-caterpillar-677.convex.cloud';
  static const String convexApiKey = 'prod:judicious-caterpillar-677|eyJ2MiI6ImVkZDdjZGQxZmUyOTQ0Njg4MTQ3MTBkZTMwMDRjNThkIn0=';
  
  // API Endpoints
  static const String baseUrl = 'https://api.sportsbet.com';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // WebSocket Configuration
  static const String websocketUrl = 'wss://ws.sportsbet.com';
  static const Duration reconnectInterval = Duration(seconds: 5);
  
  // Cache Configuration
  static const Duration cacheExpiry = Duration(minutes: 30);
  static const Duration oddsRefreshRate = Duration(seconds: 1);
  
  // Betting Limits
  static const double minBetAmount = 1.0;
  static const double maxBetAmount = 10000.0;
  static const int maxSelectionsInBetSlip = 20;
  
  // UI Constants
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Local Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userTokenKey = 'user_token'; // deprecated, kept for compatibility
  static const String themeKey = 'app_theme';
  static const String languageKey = 'app_language';
  static const String biometricKey = 'biometric_enabled';
}
