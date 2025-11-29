import 'package:flutter/material.dart';

/// Error severity levels
enum ErrorSeverity {
  info,
  warning,
  error,
  success,
}

/// Error types for better categorization
enum ErrorType {
  network,
  authentication,
  validation,
  server,
  payment,
  betting,
  unknown,
}

/// App error model
class AppError {
  final String message;
  final String? title;
  final ErrorSeverity severity;
  final ErrorType type;
  final String? technicalDetails;
  final DateTime timestamp;

  AppError({
    required this.message,
    this.title,
    this.severity = ErrorSeverity.error,
    this.type = ErrorType.unknown,
    this.technicalDetails,
  }) : timestamp = DateTime.now();

  /// Factory constructors for common error types
  factory AppError.network({String? message}) {
    return AppError(
      title: 'Connection Error',
      message: message ?? 'Please check your internet connection and try again',
      severity: ErrorSeverity.error,
      type: ErrorType.network,
    );
  }

  factory AppError.authentication({String? message}) {
    return AppError(
      title: 'Authentication Failed',
      message: message ?? 'Invalid credentials. Please try again',
      severity: ErrorSeverity.error,
      type: ErrorType.authentication,
    );
  }

  factory AppError.validation({required String message}) {
    return AppError(
      title: 'Validation Error',
      message: message,
      severity: ErrorSeverity.warning,
      type: ErrorType.validation,
    );
  }

  factory AppError.server({String? message}) {
    return AppError(
      title: 'Server Error',
      message: message ?? 'Something went wrong. Please try again later',
      severity: ErrorSeverity.error,
      type: ErrorType.server,
    );
  }

  factory AppError.payment({required String message}) {
    return AppError(
      title: 'Payment Error',
      message: message,
      severity: ErrorSeverity.error,
      type: ErrorType.payment,
    );
  }

  factory AppError.betting({required String message}) {
    return AppError(
      title: 'Betting Error',
      message: message,
      severity: ErrorSeverity.error,
      type: ErrorType.betting,
    );
  }

  factory AppError.success({required String message, String? title}) {
    return AppError(
      title: title ?? 'Success',
      message: message,
      severity: ErrorSeverity.success,
      type: ErrorType.unknown,
    );
  }

  factory AppError.info({required String message, String? title}) {
    return AppError(
      title: title ?? 'Info',
      message: message,
      severity: ErrorSeverity.info,
      type: ErrorType.unknown,
    );
  }

  /// Parse exception to AppError
  factory AppError.fromException(dynamic exception) {
    final errorMessage = exception.toString();
    
    // Check for common error patterns
    if (errorMessage.contains('SocketException') || 
        errorMessage.contains('Network') ||
        errorMessage.contains('connection')) {
      return AppError.network();
    }
    
    if (errorMessage.contains('unauthorized') || 
        errorMessage.contains('Unauthorized') ||
        errorMessage.contains('401')) {
      return AppError.authentication();
    }
    
    if (errorMessage.contains('500') || 
        errorMessage.contains('502') ||
        errorMessage.contains('503')) {
      return AppError.server();
    }
    
    return AppError(
      message: _cleanErrorMessage(errorMessage),
      severity: ErrorSeverity.error,
      type: ErrorType.unknown,
      technicalDetails: errorMessage,
    );
  }

  /// Clean up error messages for display
  static String _cleanErrorMessage(String message) {
    // Remove "Exception: " prefix
    message = message.replaceFirst(RegExp(r'^Exception:\s*'), '');
    message = message.replaceFirst(RegExp(r'^Error:\s*'), '');
    
    // Capitalize first letter
    if (message.isNotEmpty) {
      message = message[0].toUpperCase() + message.substring(1);
    }
    
    return message;
  }

  IconData get icon {
    switch (severity) {
      case ErrorSeverity.info:
        return Icons.info_outline;
      case ErrorSeverity.warning:
        return Icons.warning_amber_outlined;
      case ErrorSeverity.error:
        return Icons.error_outline;
      case ErrorSeverity.success:
        return Icons.check_circle_outline;
    }
  }

  Color getColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    switch (severity) {
      case ErrorSeverity.info:
        return isDark ? Colors.blue.shade300 : Colors.blue.shade700;
      case ErrorSeverity.warning:
        return isDark ? Colors.orange.shade300 : Colors.orange.shade700;
      case ErrorSeverity.error:
        return isDark ? Colors.red.shade300 : Colors.red.shade700;
      case ErrorSeverity.success:
        return isDark ? Colors.green.shade300 : Colors.green.shade700;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    switch (severity) {
      case ErrorSeverity.info:
        return isDark ? Colors.blue.shade900.withOpacity(0.3) : Colors.blue.shade50;
      case ErrorSeverity.warning:
        return isDark ? Colors.orange.shade900.withOpacity(0.3) : Colors.orange.shade50;
      case ErrorSeverity.error:
        return isDark ? Colors.red.shade900.withOpacity(0.3) : Colors.red.shade50;
      case ErrorSeverity.success:
        return isDark ? Colors.green.shade900.withOpacity(0.3) : Colors.green.shade50;
    }
  }
}
