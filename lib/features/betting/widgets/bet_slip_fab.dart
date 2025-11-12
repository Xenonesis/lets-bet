import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/router/app_router.dart';

class BetSlipFab extends ConsumerWidget {
  const BetSlipFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final betSlip = ref.watch(betSlipProvider);
    
    if (betSlip.selections.isEmpty) {
      return const SizedBox.shrink();
    }

    return FloatingActionButton.extended(
      onPressed: () => AppNavigation.toBetSlip(context),
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      elevation: 6,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.shopping_cart, size: 20),
          const SizedBox(width: 8),
          Text(
            'Bet Slip (${betSlip.selections.length})',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          if (betSlip.potentialWin != null && betSlip.potentialWin! > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '₹${betSlip.potentialWin!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}