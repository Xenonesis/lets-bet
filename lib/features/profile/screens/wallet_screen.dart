import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/widgets/error_feedback.dart';
import '../../../core/utils/error_handler.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  late Razorpay _razorpay;
  double? _pendingDepositAmount;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      final user = ref.read(currentUserProvider);
      if (user == null || _pendingDepositAmount == null) return;

      await ref.read(convexServiceProvider).mutation<Map<String, dynamic>>(
        'wallets:deposit',
        {
          'userId': user.id,
          'amount': _pendingDepositAmount!,
          'paymentMethod': 'Razorpay',
          'reference': response.paymentId ?? response.orderId ?? 'unknown',
        },
      );

      _pendingDepositAmount = null;
      ErrorFeedback.showSuccess(
        context,
        'Payment successful! Your wallet has been updated.',
      );
      ref.refresh(walletProvider);
    } catch (e) {
      _pendingDepositAmount = null;
      ErrorFeedback.showError(
        context,
        'Failed to update wallet. Please contact support if amount was deducted.',
        title: 'Wallet Update Failed',
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ErrorFeedback.showError(
      context,
      response.message ?? 'Payment could not be processed. Please try again.',
      title: 'Payment Failed',
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ErrorFeedback.showInfo(
      context,
      'Payment will be processed through ${response.walletName}',
      title: 'External Wallet',
    );
  }

  void _openCheckout(double amount) {
    _pendingDepositAmount = amount;
    var options = {
      'key': 'rzp_test_your_key_here', // TODO: Use actual key from env
      'amount': (amount * 100).toInt(), // Amount in paise
      'name': 'SportsBet Pro',
      'description': 'Wallet Deposit',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final walletAsync = ref.watch(walletProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(walletProvider),
          ),
        ],
      ),
      body: walletAsync.when(
        data: (wallet) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Balance Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor.withOpacity(0.8),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₹${wallet?.totalBalance.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (wallet != null) ...[
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Main Balance',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '₹${wallet.balance.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white30,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Bonus Balance',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '₹${wallet.bonusBalance.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _showDepositDialog(context),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text('Deposit'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _showWithdrawDialog(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      icon: const Icon(Icons.remove),
                      label: const Text('Withdraw'),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Quick Actions
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.history),
                      title: const Text('Transaction History'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // TODO: Navigate to transaction history
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.card_giftcard),
                      title: const Text('Promotions'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // TODO: Navigate to promotions
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.help_outline),
                      title: const Text('Payment Help'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // TODO: Navigate to payment help
                      },
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Security Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.security, color: Colors.green[600]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Secure Payments',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green[700],
                            ),
                          ),
                          Text(
                            'All transactions are encrypted and secure',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Failed to load wallet'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(walletProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDepositDialog(BuildContext context) {
    final amountController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deposit Funds'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount (₹)',
                hintText: 'Enter amount to deposit',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Payment methods: UPI, Cards, Net Banking, Wallets'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(amountController.text);
              if (amount != null && amount > 0) {
                Navigator.of(context).pop();
                _openCheckout(amount);
              } else {
                ErrorFeedback.showWarning(
                  context,
                  'Please enter a valid deposit amount',
                );
              }
            },
            child: const Text('Deposit'),
          ),
        ],
      ),
    );
  }

  void _showWithdrawDialog(BuildContext context) {
    final amountController = TextEditingController();
    final upiController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Withdraw Funds'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount (₹)',
                hintText: 'Enter amount to withdraw (min ₹100)',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: upiController,
              decoration: const InputDecoration(
                labelText: 'UPI ID',
                hintText: 'Enter your UPI ID (e.g., user@upi)',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Processing time: 1-3 business days\nMinimum withdrawal: ₹100',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final amount = double.tryParse(amountController.text);
              final upiId = upiController.text.trim();
              
              if (amount == null || amount < 100) {
                ErrorFeedback.showWarning(
                  context,
                  'Please enter a valid amount (minimum ₹100)',
                );
                return;
              }
              
              if (upiId.isEmpty || !upiId.contains('@')) {
                ErrorFeedback.showWarning(
                  context,
                  'Please enter a valid UPI ID (e.g., user@paytm)',
                );
                return;
              }
              
              try {
                final user = ref.read(currentUserProvider);
                if (user == null) return;
                
                await ref.read(convexServiceProvider).mutation<Map<String, dynamic>>(
                  'wallets:withdraw',
                  {
                    'userId': user.id,
                    'amount': amount,
                    'upiId': upiId,
                  },
                );
                
                Navigator.of(context).pop();
                ErrorFeedback.showSuccess(
                  context,
                  'Withdrawal request submitted successfully. It will be processed within 24-48 hours.',
                );
                ref.refresh(walletProvider);
              } catch (e) {
                ErrorFeedback.showException(context, e);
              }
            },
            child: const Text('Withdraw'),
          ),
        ],
      ),
    );
  }
}