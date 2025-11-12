import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../matches/widgets/match_card.dart';

class SportDetailScreen extends ConsumerWidget {
  final String sportId;

  const SportDetailScreen({super.key, required this.sportId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaguesAsync = ref.watch(leaguesProvider(sportId));
    final upcomingMatchesAsync = ref.watch(upcomingMatchesProvider(sportId));
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport Details'),
      ),
      body: CustomScrollView(
        slivers: [
          // Leagues Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Leagues',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  leaguesAsync.when(
                    data: (leagues) {
                      if (leagues.isEmpty) {
                        return Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text('No leagues available'),
                          ),
                        );
                      }
                      
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: leagues.length,
                          itemBuilder: (context, index) {
                            final league = leagues[index];
                            return Container(
                              width: 120,
                              margin: EdgeInsets.only(
                                right: index == leagues.length - 1 ? 0 : 12,
                              ),
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    // TODO: Navigate to league matches
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (league.logo.isNotEmpty)
                                          Image.network(
                                            league.logo,
                                            height: 32,
                                            width: 32,
                                            errorBuilder: (_, __, ___) =>
                                                const Icon(Icons.sports),
                                          )
                                        else
                                          const Icon(Icons.sports, size: 32),
                                        const SizedBox(height: 4),
                                        Text(
                                          league.name,
                                          style: Theme.of(context).textTheme.bodySmall,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    loading: () => SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) => Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    error: (_, __) => Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text('Failed to load leagues'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Matches Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Upcoming Matches',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          upcomingMatchesAsync.when(
            data: (matches) {
              if (matches.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Text('No upcoming matches'),
                    ),
                  ),
                );
              }
              
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: MatchCard(match: matches[index]),
                      );
                    },
                    childCount: matches.length,
                  ),
                ),
              );
            },
            loading: () => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    height: 180,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  childCount: 5,
                ),
              ),
            ),
            error: (_, __) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red),
                      const Text('Failed to load matches'),
                      ElevatedButton(
                        onPressed: () => ref.refresh(upcomingMatchesProvider(sportId)),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}