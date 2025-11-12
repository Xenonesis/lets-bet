import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../matches/widgets/match_card.dart';

class FeaturedMatchesSection extends ConsumerWidget {
  const FeaturedMatchesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredMatchesAsync = ref.watch(featuredMatchesProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured Matches',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Navigate to all matches
              },
              child: const Text('View All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        featuredMatchesAsync.when(
          data: (matches) {
            if (matches.isEmpty) {
              return Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text('No featured matches available'),
                ),
              );
            }
            
            return SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matches.length,
                padding: const EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 0 : 12,
                    ),
                    child: SizedBox(
                      width: 280,
                      child: MatchCard(match: matches[index]),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 12),
                child: Container(
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          error: (error, stack) => Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red[400]),
                  const SizedBox(height: 8),
                  Text(
                    'Failed to load matches',
                    style: TextStyle(color: Colors.red[600]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}