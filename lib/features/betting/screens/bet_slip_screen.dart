import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/models/betting.dart';
import '../widgets/bet_slip_item_card.dart';
import '../widgets/bet_type_selector.dart';

class BetSlipScreen extends ConsumerStatefulWidget {
  const BetSlipScreen({super.key});

  @override
  ConsumerState<BetSlipScreen> createState() => _BetSlipScreenState();
}

class _BetSlipScreenState extends ConsumerState<BetSlipScreen> {
  final _stakeController = TextEditingController();
  bool _isPlacing = false;

  @override
  void dispose() {
    _stakeController.dispose();
    super.dispose();
  }

  Future<void> _placeBet() async {
    final betSlip = ref.read(betSlipProvider);
    final user = ref.read(currentUserProvider);
    
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to place bets')),
      );
      return;
    }
    
    if (!betSlip.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please check your bet slip')),
      );
      return;
    }

    setState(() => _isPlacing = true);

    try {
      final convexService = ref.read(convexServiceProvider);
      
      await convexService.placeBet({
        'userId': user.id,
        'type': betSlip.betType.name,
        'totalStake': betSlip.totalStake,
        'potentialWin': betSlip.potentialWin,
        'selections': betSlip.selections.map((selection) => {
          'matchId': selection.matchId,
          'marketId': selection.marketId,
          'outcomeId': selection.outcomeId,
          'odds': selection.odds,
        }).toList(),
      });

      ref.read(betSlipProvider.notifier).clear();
      
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bet placed successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to place bet: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isPlacing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final betSlip = ref.watch(betSlipProvider);
    final wallet = ref.watch(walletProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bet Slip'),
        actions: [
          if (betSlip.selections.isNotEmpty)
            TextButton(
              onPressed: () {
                ref.read(betSlipProvider.notifier).clear();
              },
              child: const Text('Clear All'),
            ),
        ],
      ),
      body: betSlip.selections.isEmpty
          ? const _EmptyBetSlip()
          : Column(
              children: [
                // Bet Type Selector
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: BetTypeSelector(
                    selectedType: betSlip.betType,
                    onTypeChanged: (type) {
                      ref.read(betSlipProvider.notifier).setBetType(type);
                    },
                  ),
                ),
                
                // Selections List
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: betSlip.selections.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: BetSlipItemCard(
                          item: betSlip.selections[index],
                          betType: betSlip.betType,
                          onStakeChanged: (stake) {
                            ref.read(betSlipProvider.notifier).updateStake(
                              betSlip.selections[index].marketId,
                              stake,
                            );
                          },
                          onRemove: () {
                            ref.read(betSlipProvider.notifier).removeSelection(
                              betSlip.selections[index].marketId,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                
                // Betting Summary and Place Bet
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Total Stake Input
                      if (betSlip.betType == BetType.multiple) ...[
                        TextFormField(
                          controller: _stakeController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Total Stake',
                            prefixText: '₹',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            final stake = double.tryParse(value) ?? 0.0;
                            ref.read(betSlipProvider.notifier).updateTotalStake(stake);
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                      
                      // Summary
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Odds:'),
                                Text(
                                  betSlip.totalOdds.toStringAsFixed(2),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            if (betSlip.totalStake != null) ...[
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total Stake:'),
                                  Text(
                                    '₹${betSlip.totalStake!.toStringAsFixed(2)}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Potential Win:'),
                                  Text(
                                    '₹${betSlip.potentialWin?.toStringAsFixed(2) ?? '0.00'}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[600],
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Wallet Balance
                      wallet.when(
                        data: (walletData) => Text(
                          'Wallet Balance: ₹${walletData?.balance.toStringAsFixed(2) ?? '0.00'}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Accept Odds Changes
                      Row(
                        children: [
                          Checkbox(
                            value: betSlip.acceptOddsChanges,
                            onChanged: (_) {
                              ref.read(betSlipProvider.notifier).toggleAcceptOddsChanges();
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'Accept odds changes',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12),
                      
                      // Place Bet Button
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: betSlip.isValid && !_isPlacing ? _placeBet : null,
                          child: _isPlacing
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : const Text('Place Bet'),
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

class _EmptyBetSlip extends StatelessWidget {
  const _EmptyBetSlip();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Your bet slip is empty',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some selections to get started',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Browse Matches'),
          ),
        ],
      ),
    );
  }
}