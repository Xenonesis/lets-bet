import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../widgets/bet_history_item.dart';

class BetHistoryScreen extends ConsumerWidget {
  const BetHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userBetsAsync = ref.watch(userBetsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bet History'),
      ),
      body: userBetsAsync.when(
        data: (bets) {
          if (bets.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No betting history',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your bets will appear here',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }
          
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bets.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: BetHistoryItem(bet: bets[index]),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Failed to load bet history'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(userBetsProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}