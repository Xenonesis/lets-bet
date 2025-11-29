import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/animations/app_animations.dart';
import '../../matches/widgets/live_match_card.dart';

class LiveMatchesSection extends ConsumerWidget {
  const LiveMatchesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveMatchesAsync = ref.watch(liveMatchesProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PulsingWidget(
                  duration: const Duration(milliseconds: 1500),
                  minScale: 0.8,
                  maxScale: 1.2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppTheme.errorColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.errorColor.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Live Matches',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                // TODO: Navigate to live screen
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('View All', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Theme.of(context).colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        liveMatchesAsync.when(
          data: (matches) {
            if (matches.isEmpty) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.live_tv_outlined, color: Colors.grey),
                      SizedBox(height: 4),
                      Text(
                        'No live matches at the moment',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            }
            
            return SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matches.length,
                padding: const EdgeInsets.only(right: 16),
                itemBuilder: (context, index) {
                  return AppAnimations.staggeredList(
                    index: index,
                    duration: AppAnimations.normal,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 0 : 12,
                      ),
                      child: SizedBox(
                        width: 260,
                        child: LiveMatchCard(match: matches[index]),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          loading: () => SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 0 : 12),
                child: Container(
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          error: (error, stack) => Container(
            height: 100,
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
                    'Failed to load live matches',
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