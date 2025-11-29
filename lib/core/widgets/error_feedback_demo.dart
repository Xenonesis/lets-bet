import 'package:flutter/material.dart';
import '../utils/error_handler.dart';
import 'error_feedback.dart';
import 'retry_widget.dart';

/// Demo screen showing all error feedback options
/// This is for demonstration purposes and can be accessed during development
class ErrorFeedbackDemo extends StatefulWidget {
  const ErrorFeedbackDemo({super.key});

  @override
  State<ErrorFeedbackDemo> createState() => _ErrorFeedbackDemoState();
}

class _ErrorFeedbackDemoState extends State<ErrorFeedbackDemo> {
  bool _showRetryWidget = false;
  bool _showEmptyState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Feedback Demo'),
        centerTitle: true,
      ),
      body: _showRetryWidget
          ? RetryWidget(
              error: AppError.network(),
              onRetry: () {
                setState(() => _showRetryWidget = false);
              },
            )
          : _showEmptyState
              ? EmptyStateWidget(
                  icon: Icons.sports_soccer,
                  title: 'No Matches Available',
                  message: 'There are no live matches at the moment. Check back later!',
                  action: ElevatedButton(
                    onPressed: () {
                      setState(() => _showEmptyState = false);
                    },
                    child: const Text('Go Back'),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Text(
                      'Snackbar Examples',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Show Success',
                      color: Colors.green,
                      onPressed: () {
                        ErrorFeedback.showSuccess(
                          context,
                          'Your action was completed successfully!',
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Show Error',
                      color: Colors.red,
                      onPressed: () {
                        ErrorFeedback.showError(
                          context,
                          'An error occurred while processing your request',
                          title: 'Error',
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Show Warning',
                      color: Colors.orange,
                      onPressed: () {
                        ErrorFeedback.showWarning(
                          context,
                          'Please review your information before proceeding',
                          title: 'Warning',
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Show Info',
                      color: Colors.blue,
                      onPressed: () {
                        ErrorFeedback.showInfo(
                          context,
                          'This is an informational message for you',
                          title: 'Information',
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Specific Error Types',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Network Error',
                      color: Colors.red.shade700,
                      onPressed: () {
                        ErrorFeedback.showSnackbar(
                          context,
                          AppError.network(),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Authentication Error',
                      color: Colors.red.shade700,
                      onPressed: () {
                        ErrorFeedback.showSnackbar(
                          context,
                          AppError.authentication(
                            message: 'Your session has expired. Please login again',
                          ),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Validation Error',
                      color: Colors.orange.shade700,
                      onPressed: () {
                        ErrorFeedback.showSnackbar(
                          context,
                          AppError.validation(
                            message: 'Please fill in all required fields',
                          ),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Server Error',
                      color: Colors.red.shade700,
                      onPressed: () {
                        ErrorFeedback.showSnackbar(
                          context,
                          AppError.server(),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Payment Error',
                      color: Colors.red.shade700,
                      onPressed: () {
                        ErrorFeedback.showSnackbar(
                          context,
                          AppError.payment(
                            message: 'Payment failed. Please try again or use a different method',
                          ),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Betting Error',
                      color: Colors.red.shade700,
                      onPressed: () {
                        ErrorFeedback.showSnackbar(
                          context,
                          AppError.betting(
                            message: 'Insufficient funds. Please add money to your wallet',
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Dialog Examples',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Show Error Dialog',
                      color: Colors.red,
                      onPressed: () {
                        ErrorFeedback.showErrorDialog(
                          context,
                          AppError(
                            title: 'Critical Error',
                            message: 'A critical error has occurred. Please restart the app.',
                            severity: ErrorSeverity.error,
                            technicalDetails: 'Exception: NullPointerException at line 123',
                          ),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Show Success Dialog',
                      color: Colors.green,
                      onPressed: () {
                        ErrorFeedback.showErrorDialog(
                          context,
                          AppError.success(
                            title: 'Congratulations!',
                            message: 'Your bet won! Winnings have been added to your wallet.',
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Bottom Sheet Examples',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Show Error Bottom Sheet',
                      color: Colors.red,
                      onPressed: () {
                        ErrorFeedback.showBottomSheet(
                          context,
                          AppError.network(),
                          actions: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Try Again'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Banner Examples',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Show Error Banner',
                      color: Colors.red,
                      onPressed: () {
                        ErrorFeedback.showBanner(
                          context,
                          AppError.network(),
                        );
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Show Success Banner',
                      color: Colors.green,
                      onPressed: () {
                        ErrorFeedback.showBanner(
                          context,
                          AppError.success(message: 'Operation completed successfully!'),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Widget Examples',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Show Retry Widget',
                      color: Colors.blue,
                      onPressed: () {
                        setState(() => _showRetryWidget = true);
                      },
                    ),
                    
                    _DemoButton(
                      label: 'Show Empty State',
                      color: Colors.grey,
                      onPressed: () {
                        setState(() => _showEmptyState = true);
                      },
                    ),
                    
                    const SizedBox(height: 16),
                    
                    const InlineErrorWidget(
                      message: 'This is an inline error message',
                    ),
                    
                    const SizedBox(height: 16),
                    
                    const InlineSuccessWidget(
                      message: 'This is an inline success message',
                    ),
                    
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 24),
                    
                    const Text(
                      'Exception Handling',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    _DemoButton(
                      label: 'Simulate Exception',
                      color: Colors.red,
                      onPressed: () {
                        try {
                          throw Exception('This is a simulated exception for testing');
                        } catch (e) {
                          ErrorFeedback.showException(context, e);
                        }
                      },
                    ),
                    
                    const SizedBox(height: 16),
                  ],
                ),
    );
  }
}

class _DemoButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _DemoButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
