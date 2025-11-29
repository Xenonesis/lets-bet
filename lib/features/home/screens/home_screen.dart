import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/animations/app_animations.dart';
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
            surfaceTintColor: Colors.transparent,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome back,',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  user?.firstName ?? 'Guest',
                  style: Theme.of(context).textTheme.headlineSmall,
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
              const SizedBox(width: 4),
            ],
          ),
          
          // Content
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Wallet Balance
                const WalletBalanceCard(),
                
                const SizedBox(height: 24),
                
                // Promotions Banner
                const PromotionsBanner(),
                
                const SizedBox(height: 32),
                
                // Live Matches Section
                AppAnimations.fadeSlideIn(
                  duration: AppAnimations.slow,
                  slideBegin: const Offset(0, 0.03),
                  child: const LiveMatchesSection(),
                ),
                
                const SizedBox(height: 32),
                
                // Featured Matches Section
                AppAnimations.fadeSlideIn(
                  duration: AppAnimations.slow,
                  slideBegin: const Offset(0, 0.03),
                  child: const FeaturedMatchesSection(),
                ),
                
                const SizedBox(height: 32),
                
                // Sports Grid Section
                AppAnimations.fadeSlideIn(
                  duration: AppAnimations.verySlow,
                  slideBegin: const Offset(0, 0.03),
                  child: const SportsGridSection(),
                ),
                
                const SizedBox(height: 100), // Bottom padding for FAB
              ]),
            ),
          ),
        ],
      ),
    );
  }
}