# Error Feedback System - User Guide

## Overview

This application implements a comprehensive error feedback system that provides users with clear, contextual, and visually appealing error messages and notifications. The system is designed to enhance user experience by making errors understandable and actionable.

## Features

### 1. **Multiple Display Types**
- **Snackbars**: Non-intrusive, bottom-floating messages
- **Dialogs**: Modal alerts for critical information
- **Bottom Sheets**: Large, scrollable information panels
- **Banners**: Top-of-screen notifications with animations
- **Inline Widgets**: Form-level error/success indicators
- **Retry Widgets**: Full-screen error states with retry options
- **Empty States**: User-friendly no-data displays

### 2. **Error Severity Levels**
- ✅ **Success**: Green indicators for successful operations
- ℹ️ **Info**: Blue indicators for informational messages
- ⚠️ **Warning**: Orange indicators for warnings
- ❌ **Error**: Red indicators for errors

### 3. **Error Categories**
- **Network**: Connection and network-related errors
- **Authentication**: Login and auth failures
- **Validation**: Form and input validation errors
- **Server**: Backend and API errors
- **Payment**: Payment processing errors
- **Betting**: Bet placement and betting-related errors
- **Unknown**: General errors

## Usage Examples

### Basic Usage

#### Success Messages
```dart
ErrorFeedback.showSuccess(
  context,
  'Your bet has been placed successfully!',
);
```

#### Error Messages
```dart
ErrorFeedback.showError(
  context,
  'Failed to process payment',
  title: 'Payment Error',
);
```

#### Warning Messages
```dart
ErrorFeedback.showWarning(
  context,
  'Please review your information before proceeding',
  title: 'Warning',
);
```

#### Info Messages
```dart
ErrorFeedback.showInfo(
  context,
  'Your withdrawal will be processed within 24-48 hours',
  title: 'Information',
);
```

### Advanced Usage

#### Handling Exceptions
```dart
try {
  await someAsyncOperation();
} catch (e) {
  ErrorFeedback.showException(context, e);
}
```

The system will automatically parse the exception and display an appropriate error message.

#### Specific Error Types
```dart
// Network error
ErrorFeedback.showSnackbar(
  context,
  AppError.network(),
);

// Authentication error
ErrorFeedback.showSnackbar(
  context,
  AppError.authentication(
    message: 'Your session has expired',
  ),
);

// Payment error
ErrorFeedback.showSnackbar(
  context,
  AppError.payment(
    message: 'Payment failed. Please try again',
  ),
);
```

#### Dialogs with Actions
```dart
ErrorFeedback.showDialog(
  context,
  AppError(
    title: 'Confirm Action',
    message: 'Are you sure you want to proceed?',
    severity: ErrorSeverity.warning,
  ),
  actions: [
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('Cancel'),
    ),
    ElevatedButton(
      onPressed: () {
        // Perform action
        Navigator.pop(context);
      },
      child: const Text('Confirm'),
    ),
  ],
);
```

#### Bottom Sheets
```dart
ErrorFeedback.showBottomSheet(
  context,
  AppError.network(),
  actions: [
    SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Retry logic
        },
        child: const Text('Try Again'),
      ),
    ),
  ],
);
```

#### Banners
```dart
ErrorFeedback.showBanner(
  context,
  AppError.info(
    message: 'New features available!',
  ),
  duration: const Duration(seconds: 5),
);
```

### Widget Usage

#### Retry Widget
For full-screen error states with retry functionality:
```dart
RetryWidget(
  error: AppError.network(),
  onRetry: () {
    // Retry logic
  },
)
```

#### Empty State Widget
For displaying no-data states:
```dart
EmptyStateWidget(
  icon: Icons.sports_soccer,
  title: 'No Matches Available',
  message: 'There are no live matches at the moment',
  action: ElevatedButton(
    onPressed: () {
      // Action
    },
    child: const Text('Refresh'),
  ),
)
```

#### Inline Messages
For form-level feedback:
```dart
// Error message
InlineErrorWidget(
  message: 'Please enter a valid email address',
)

// Success message
InlineSuccessWidget(
  message: 'Email verified successfully',
)
```

## Implementation in Features

### Authentication Screens
- **Login**: Network errors, authentication failures, success messages
- **Register**: Validation errors, terms acceptance warnings, success messages
- **Forgot Password**: Email validation, success confirmations

### Betting Screens
- **Bet Slip**: Authentication checks, validation warnings, bet placement success
- **Match Details**: Loading states, network errors

### Profile Screens
- **Wallet**: Payment errors, transaction success, validation warnings
- **Bet History**: Empty states, loading errors

## Custom Error Types

### Creating Custom Errors
```dart
final customError = AppError(
  title: 'Custom Error',
  message: 'This is a custom error message',
  severity: ErrorSeverity.error,
  type: ErrorType.unknown,
  technicalDetails: 'Stack trace or debug info',
);

ErrorFeedback.showSnackbar(context, customError);
```

### Factory Constructors
Available factory methods for common scenarios:
- `AppError.network()`
- `AppError.authentication()`
- `AppError.validation()`
- `AppError.server()`
- `AppError.payment()`
- `AppError.betting()`
- `AppError.success()`
- `AppError.info()`
- `AppError.fromException()`

## Styling and Theming

The error feedback system automatically adapts to:
- **Dark/Light themes**: Color schemes adjust based on theme brightness
- **Material Design**: Follows Material 3 design principles
- **Accessibility**: High contrast colors for readability

## Best Practices

### 1. Choose the Right Display Type
- **Snackbar**: Quick, non-critical feedback (default choice)
- **Dialog**: Important errors that require acknowledgment
- **Bottom Sheet**: Complex errors with multiple actions
- **Banner**: Time-sensitive notifications
- **Inline**: Form-level validation errors

### 2. Write User-Friendly Messages
✅ **Good**: "Please check your internet connection and try again"
❌ **Bad**: "SocketException: Connection refused"

### 3. Provide Context
Always include a title for important errors:
```dart
ErrorFeedback.showError(
  context,
  'Your payment could not be processed',
  title: 'Payment Failed',
);
```

### 4. Make Errors Actionable
Include clear next steps or retry options:
```dart
RetryWidget(
  error: AppError.network(),
  onRetry: _loadData,
  retryButtonText: 'Reload Data',
)
```

### 5. Use Appropriate Severity
- **Error**: Something went wrong and requires attention
- **Warning**: Potential issue or required action
- **Info**: Helpful information
- **Success**: Confirmation of successful action

### 6. Handle Loading States
Show loading indicators during operations:
```dart
bool _isLoading = false;

Future<void> _performAction() async {
  setState(() => _isLoading = true);
  
  try {
    await someOperation();
    ErrorFeedback.showSuccess(context, 'Done!');
  } catch (e) {
    ErrorFeedback.showException(context, e);
  } finally {
    setState(() => _isLoading = false);
  }
}
```

## Testing

A demo screen is available at `lib/core/widgets/error_feedback_demo.dart` that showcases all error feedback types and variations. Use this for:
- Visual testing
- QA verification
- Design review
- Developer reference

## Migration from Old Code

### Before (Old Approach)
```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Error: $e'),
    backgroundColor: Colors.red,
  ),
);
```

### After (New Approach)
```dart
ErrorFeedback.showException(context, e);
```

## Technical Details

### Files
- `lib/core/utils/error_handler.dart`: Error models and types
- `lib/core/widgets/error_feedback.dart`: Main feedback manager and widgets
- `lib/core/widgets/retry_widget.dart`: Retry and empty state widgets
- `lib/core/widgets/error_feedback_demo.dart`: Demo and examples

### Dependencies
- Flutter Material
- No external dependencies required

## Future Enhancements

Potential improvements:
- Error logging and analytics integration
- Offline error queue
- User feedback collection
- Multi-language support
- Haptic feedback for errors
- Sound notifications (optional)
- Error history tracking

## Support

For questions or issues with the error feedback system:
1. Check this guide
2. Review the demo screen
3. Examine existing implementations in auth/betting/profile screens
4. Consult the code documentation in source files

---

**Version**: 1.0  
**Last Updated**: 2024  
**Maintained By**: Development Team
