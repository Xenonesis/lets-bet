import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/models/match.dart';
import '../../../core/router/app_router.dart';

class MatchCard extends StatelessWidget {
  final Match match;

  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final isLive = match.status == MatchStatus.live;
    final startTime = DateFormat('MMM dd, HH:mm').format(match.startTime);
    
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => AppNavigation.toMatchDetail(context, match.id),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Match Status and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isLive) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'LIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Text(
                      startTime,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  if (match.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '⭐',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Teams
              Row(
                children: [
                  // Home Team
                  Expanded(
                    child: Column(
                      children: [
                        if (match.homeTeamLogo != null) ...[
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(match.homeTeamLogo!),
                            backgroundColor: Colors.grey[200],
                          ),
                          const SizedBox(height: 4),
                        ],
                        Text(
                          match.homeTeam,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  
                  // Score or VS
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: match.score != null
                        ? Text(
                            '${match.score!.home} - ${match.score!.away}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Text(
                            'VS',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                  ),
                  
                  // Away Team
                  Expanded(
                    child: Column(
                      children: [
                        if (match.awayTeamLogo != null) ...[
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(match.awayTeamLogo!),
                            backgroundColor: Colors.grey[200],
                          ),
                          const SizedBox(height: 4),
                        ],
                        Text(
                          match.awayTeam,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              // Quick bet options
              if (match.isPreMatchEnabled || match.isLiveEnabled) ...[
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _QuickBetButton(
                      label: '1',
                      odds: '2.10',
                      onPressed: () {
                        // TODO: Add to bet slip
                      },
                    ),
                    _QuickBetButton(
                      label: 'X',
                      odds: '3.20',
                      onPressed: () {
                        // TODO: Add to bet slip
                      },
                    ),
                    _QuickBetButton(
                      label: '2',
                      odds: '3.80',
                      onPressed: () {
                        // TODO: Add to bet slip
                      },
                    ),
                  ],
                ),
              ],
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