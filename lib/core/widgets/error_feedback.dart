import 'package:flutter/material.dart';
import '../utils/error_handler.dart';
import 'package:flutter/material.dart' as material;

/// Main error feedback manager
class ErrorFeedback {
  /// Show a snackbar with error details
  static void showSnackbar(
    BuildContext context,
    AppError error, {
    Duration duration = const Duration(seconds: 4),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _ErrorSnackbarContent(error: error),
        backgroundColor: error.getBackgroundColor(context),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: error.getColor(context).withOpacity(0.3),
            width: 1,
          ),
        ),
        duration: duration,
        action: action,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  /// Show a dialog with error details
  static Future<void> showErrorDialog(
    BuildContext context,
    AppError error, {
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return material.showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ErrorDialog(
        error: error,
        actions: actions,
      ),
    );
  }

  /// Show a bottom sheet with error details
  static Future<void> showBottomSheet(
    BuildContext context,
    AppError error, {
    List<Widget>? actions,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ErrorBottomSheet(
        error: error,
        actions: actions,
      ),
    );
  }

  /// Show a banner at the top of the screen
  static void showBanner(
    BuildContext context,
    AppError error, {
    Duration duration = const Duration(seconds: 5),
    VoidCallback? onDismiss,
  }) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => ErrorBanner(
        error: error,
        onDismiss: onDismiss,
      ),
    );

    overlay.insert(overlayEntry);
    
    Future.delayed(duration, () {
      overlayEntry.remove();
      onDismiss?.call();
    });
  }

  /// Quick helper methods
  static void showSuccess(
    BuildContext context,
    String message, {
    String? title,
  }) {
    showSnackbar(
      context,
      AppError.success(message: message, title: title),
    );
  }

  static void showError(
    BuildContext context,
    String message, {
    String? title,
  }) {
    showSnackbar(
      context,
      AppError(
        message: message,
        title: title,
        severity: ErrorSeverity.error,
      ),
    );
  }

  static void showWarning(
    BuildContext context,
    String message, {
    String? title,
  }) {
    showSnackbar(
      context,
      AppError(
        message: message,
        title: title,
        severity: ErrorSeverity.warning,
      ),
    );
  }

  static void showInfo(
    BuildContext context,
    String message, {
    String? title,
  }) {
    showSnackbar(
      context,
      AppError.info(message: message, title: title),
    );
  }

  /// Show error from exception
  static void showException(
    BuildContext context,
    dynamic exception, {
    bool useDialog = false,
  }) {
    final error = AppError.fromException(exception);
    if (useDialog) {
      showErrorDialog(context, error);
    } else {
      showSnackbar(context, error);
    }
  }
}

/// Snackbar content widget
class _ErrorSnackbarContent extends StatelessWidget {
  final AppError error;

  const _ErrorSnackbarContent({required this.error});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          error.icon,
          color: error.getColor(context),
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (error.title != null) ...[
                Text(
                  error.title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: error.getColor(context),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
              ],
              Text(
                error.message,
                style: TextStyle(
                  color: error.getColor(context),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Error dialog widget
class ErrorDialog extends StatelessWidget {
  final AppError error;
  final List<Widget>? actions;

  const ErrorDialog({
    super.key,
    required this.error,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: error.getBackgroundColor(context),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              error.icon,
              color: error.getColor(context),
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              error.title ?? 'Alert',
              style: TextStyle(
                color: error.getColor(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            error.message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (error.technicalDetails != null) ...[
            const SizedBox(height: 16),
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: const Text(
                'Technical Details',
                style: TextStyle(fontSize: 12),
              ),
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    error.technicalDetails!,
                    style: const TextStyle(
                      fontSize: 11,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
      actions: actions ??
          [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
    );
  }
}

/// Error bottom sheet widget
class ErrorBottomSheet extends StatelessWidget {
  final AppError error;
  final List<Widget>? actions;

  const ErrorBottomSheet({
    super.key,
    required this.error,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: error.getBackgroundColor(context),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    error.icon,
                    color: error.getColor(context),
                    size: 48,
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Title
                if (error.title != null)
                  Text(
                    error.title!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: error.getColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                
                const SizedBox(height: 12),
                
                // Message
                Text(
                  error.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 24),
                
                // Actions
                if (actions != null) ...actions!,
                if (actions == null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('OK'),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Error banner widget (overlay)
class ErrorBanner extends StatefulWidget {
  final AppError error;
  final VoidCallback? onDismiss;

  const ErrorBanner({
    super.key,
    required this.error,
    this.onDismiss,
  });

  @override
  State<ErrorBanner> createState() => _ErrorBannerState();
}

class _ErrorBannerState extends State<ErrorBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.error.getBackgroundColor(context),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.error.getColor(context).withOpacity(0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  widget.error.icon,
                  color: widget.error.getColor(context),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.error.title != null) ...[
                        Text(
                          widget.error.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: widget.error.getColor(context),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Text(
                        widget.error.message,
                        style: TextStyle(
                          color: widget.error.getColor(context),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: widget.error.getColor(context),
                  ),
                  onPressed: () {
                    _controller.reverse().then((_) {
                      widget.onDismiss?.call();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Loading overlay widget
class LoadingOverlay extends StatelessWidget {
  final String? message;
  final bool isLoading;

  const LoadingOverlay({
    super.key,
    this.message,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return const SizedBox.shrink();

    return Container(
      color: Colors.black54,
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                if (message != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    message!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
