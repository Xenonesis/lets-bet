import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../widgets/featured_matches_section.dart';
import '../widgets/live_matches_section.dart';
import '../widgets/sports_grid_section.dart';
import '../widgets/promotions_banner.dart';
import '../widgets/wallet_balance_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  user?.firstName ?? 'Guest',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  // TODO: Show notifications
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () {
                  // TODO: Show settings
                },
              ),
            ],
          ),
          
          // Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Wallet Balance
                const WalletBalanceCard(),
                
                const SizedBox(height: 20),
                
                // Promotions Banner
                const PromotionsBanner(),
                
                const SizedBox(height: 24),
                
                // Live Matches Section
                const LiveMatchesSection(),
                
                const SizedBox(height: 24),
                
                // Featured Matches Section
                const FeaturedMatchesSection(),
                
                const SizedBox(height: 24),
                
                // Sports Grid Section
                const SportsGridSection(),
                
                const SizedBox(height: 100), // Bottom padding for FAB
              ]),
            ),
          ),
        ],
      ),
    );
  }
}