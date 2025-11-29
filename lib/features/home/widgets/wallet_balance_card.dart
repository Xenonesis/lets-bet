import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/animations/app_animations.dart';

class WalletBalanceCard extends ConsumerWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletAsync = ref.watch(walletProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return AppAnimations.fadeSlideIn(
      duration: AppAnimations.normal,
      child: Container(
      padding: const EdgeInsets.all(AppTheme.spaceLg),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
      child: walletAsync.when(
        data: (wallet) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wallet Balance',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppTheme.spaceSm),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spaceMd),
            Text(
              '₹${wallet?.balance.toStringAsFixed(2) ?? '0.00'}',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            if (wallet != null && wallet.bonusBalance > 0) ...[
              const SizedBox(height: AppTheme.spaceXs),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spaceSm,
                  vertical: AppTheme.spaceXs,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                ),
                child: Text(
                  'Bonus: ₹${wallet.bonusBalance.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            const SizedBox(height: AppTheme.spaceLg),
            LayoutBuilder(
              builder: (context, constraints) {
                // Responsive button layout
                if (constraints.maxWidth < 350) {
                  // Stack buttons vertically on very small screens
                  return Column(
                    children: [
                      _buildDepositButton(context),
                      const SizedBox(height: AppTheme.spaceSm),
                      _buildWithdrawButton(context),
                    ],
                  );
                } else {
                  // Show buttons side by side
                  return Row(
                    children: [
                      Expanded(child: _buildDepositButton(context)),
                      const SizedBox(width: AppTheme.spaceSm),
                      Expanded(child: _buildWithdrawButton(context)),
                    ],
                  );
                }
              },
            ),
          ],
        ),
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.all(AppTheme.spaceLg),
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
        ),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spaceMd),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white.withOpacity(0.7),
                  size: 32,
                ),
                const SizedBox(height: AppTheme.spaceSm),
                Text(
                  'Failed to load balance',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }

  Widget _buildDepositButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Navigate to deposit
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryColor,
        elevation: 0,
        minimumSize: const Size(0, 44),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spaceMd,
          vertical: AppTheme.spaceSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        ),
      ),
      icon: const Icon(Icons.add_rounded, size: 18),
      label: const Text(
        'Deposit',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildWithdrawButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // TODO: Navigate to withdraw
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
        elevation: 0,
        minimumSize: const Size(0, 44),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spaceMd,
          vertical: AppTheme.spaceSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        ),
      ),
      icon: const Icon(Icons.arrow_upward_rounded, size: 18),
      label: const Text(
        'Withdraw',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
