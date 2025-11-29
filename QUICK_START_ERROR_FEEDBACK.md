# Quick Start: Error Feedback System

## 🚀 5-Minute Quick Start

### 1. Import the Package
```dart
import 'package:let/core/widgets/error_feedback.dart';
import 'package:let/core/utils/error_handler.dart';
```

### 2. Use in Your Code

#### Show Success Messages
```dart
ErrorFeedback.showSuccess(
  context,
  'Your bet has been placed successfully!',
);
```

#### Show Error Messages
```dart
ErrorFeedback.showError(
  context,
  'Unable to process payment',
  title: 'Payment Failed',
);
```

#### Handle Exceptions
```dart
try {
  await someOperation();
} catch (e) {
  ErrorFeedback.showException(context, e);
}
```

That's it! 🎉

## 📱 Visual Examples

### Snackbar (Default)
```dart
ErrorFeedback.showSuccess(context, 'Bet placed!');
```
**Appears as**: Green floating card at bottom with checkmark icon

---

### Dialog
```dart
ErrorFeedback.showErrorDialog(
  context,
  AppError.network(),
);
```
**Appears as**: Modal dialog with error icon and message

---

### Warning
```dart
ErrorFeedback.showWarning(
  context,
  'Insufficient funds. Please add money.',
);
```
**Appears as**: Orange snackbar with warning icon

---

### Info
```dart
ErrorFeedback.showInfo(
  context,
  'Withdrawal will be processed in 24-48 hours',
);
```
**Appears as**: Blue snackbar with info icon

---

## 🎨 All Display Types at a Glance

| Type | Method | Use Case |
|------|--------|----------|
| **Snackbar** | `showSnackbar()` | Quick feedback (default) |
| **Dialog** | `showErrorDialog()` | Important alerts |
| **Bottom Sheet** | `showBottomSheet()` | Detailed errors with actions |
| **Banner** | `showBanner()` | Top notifications |
| **Inline** | `InlineErrorWidget()` | Form validation |
| **Retry** | `RetryWidget()` | Full-screen errors |
| **Empty** | `EmptyStateWidget()` | No data states |

## 🎯 Common Scenarios

### Scenario 1: Login Failed
```dart
try {
  await login(email, password);
  ErrorFeedback.showSuccess(context, 'Welcome back!');
} catch (e) {
  ErrorFeedback.showException(context, e);
}
```

### Scenario 2: Form Validation
```dart
if (amount < 100) {
  ErrorFeedback.showWarning(
    context,
    'Minimum amount is ₹100',
  );
  return;
}
```

### Scenario 3: Network Error with Retry
```dart
RetryWidget(
  error: AppError.network(),
  onRetry: () => _loadData(),
)
```

### Scenario 4: Payment Success
```dart
ErrorFeedback.showSuccess(
  context,
  'Payment successful! Wallet updated.',
);
```

### Scenario 5: Confirm Action
```dart
ErrorFeedback.showErrorDialog(
  context,
  AppError(
    title: 'Confirm',
    message: 'Are you sure?',
    severity: ErrorSeverity.warning,
  ),
  actions: [
    TextButton(
      onPressed: () => Navigator.pop(context),
      child: Text('Cancel'),
    ),
    ElevatedButton(
      onPressed: () => _confirm(),
      child: Text('Confirm'),
    ),
  ],
);
```

## 🔥 Pro Tips

### Tip 1: Use Specific Error Types
```dart
// Instead of generic error
ErrorFeedback.showError(context, 'Payment failed');

// Use specific type
ErrorFeedback.showSnackbar(
  context,
  AppError.payment(message: 'Card declined'),
);
```

### Tip 2: Add Titles for Context
```dart
// Good
ErrorFeedback.showError(
  context,
  'Unable to place bet',
  title: 'Betting Error',
);

// Better
ErrorFeedback.showSnackbar(
  context,
  AppError.betting(
    message: 'Match has already started. Betting closed.',
  ),
);
```

### Tip 3: Choose Right Display Type
- **Quick feedback** → Snackbar
- **Important alerts** → Dialog
- **Complex info** → Bottom Sheet
- **Form errors** → Inline widgets

### Tip 4: Loading States
```dart
bool _isLoading = false;

Future<void> _submit() async {
  setState(() => _isLoading = true);
  
  try {
    await submitData();
    ErrorFeedback.showSuccess(context, 'Done!');
  } catch (e) {
    ErrorFeedback.showException(context, e);
  } finally {
    setState(() => _isLoading = false);
  }
}
```

## 📚 Learn More

- **Full Guide**: See `ERROR_FEEDBACK_GUIDE.md`
- **Demo Screen**: Run the app and check out the demo
- **Examples**: Look at updated login/wallet/betting screens

## 🎬 Try It Now!

1. Open any screen in your app
2. Add `ErrorFeedback.showSuccess(context, 'Hello!')`
3. Run the app and see the beautiful feedback!

---

**Ready to use?** Just import and start showing better errors! 🎉
