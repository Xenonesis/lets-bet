import 'package:flutter/material.dart';
import '../../../core/models/match.dart';
import '../../../core/router/app_router.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to match details
        // AppRouter.goToMatchDetails(context, match.id);
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(match.status.name.toUpperCase()),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: Text(match.homeTeam)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Text('VS'),
                  ),
                  Expanded(child: Text(match.awayTeam)),
                ],
              ),
              const SizedBox(height: 12),
              Text('Quick bets coming soon'),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickBetButton extends StatelessWidget {
  final String label;
  final String odds;
  final VoidCallback onPressed;

  const _QuickBetButton({
    required this.label,
    required this.odds,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              odds,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}