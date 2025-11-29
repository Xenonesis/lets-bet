import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/app_providers.dart';
import '../../../core/router/app_router.dart';
import '../../sports/widgets/sport_card.dart';

class SportsGridSection extends ConsumerWidget {
  const SportsGridSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportsAsync = ref.watch(sportsProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sports',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () => AppNavigation.toSports(context),
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
        sportsAsync.when(
          data: (sports) {
            if (sports.isEmpty) {
              return Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text('No sports available'),
                ),
              );
            }
            
            return LayoutBuilder(
              builder: (context, constraints) {
                // Responsive grid columns
                int crossAxisCount = 2;
                if (constraints.maxWidth >= 900) {
                  crossAxisCount = 4;
                } else if (constraints.maxWidth >= 600) {
                  crossAxisCount = 3;
                }
                
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: sports.length > 6 ? 6 : sports.length,
                  itemBuilder: (context, index) {
                    return SportCard(
                      sport: sports[index],
                      onTap: () => AppNavigation.toSportDetail(
                        context,
                        sports[index].id,
                      ),
                    );
                  },
                );
              },
            );
          },
          loading: () => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 2.5,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
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
                    'Failed to load sports',
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