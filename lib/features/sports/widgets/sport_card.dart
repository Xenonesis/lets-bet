import 'package:flutter/material.dart';
import '../../../core/models/sport.dart';
import '../../../core/animations/app_animations.dart';

class SportCard extends StatelessWidget {
  final Sport sport;
  final VoidCallback? onTap;

  const SportCard({super.key, required this.sport, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Color(
      int.parse(sport.themeColor.replaceFirst('#', '0xFF')),
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedCard(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDark
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // Sport Icon
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(isDark ? 0.2 : 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: _getSportIcon(sport.code)),
              ),

              const SizedBox(width: 14),

              // Sport Name
              Expanded(
                child: Text(
                  sport.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Arrow
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSportIcon(String sportCode) {
    IconData iconData;
    switch (sportCode.toLowerCase()) {
      case 'football':
      case 'soccer':
        iconData = Icons.sports_soccer;
        break;
      case 'basketball':
        iconData = Icons.sports_basketball;
        break;
      case 'tennis':
        iconData = Icons.sports_tennis;
        break;
      case 'cricket':
        iconData = Icons.sports_cricket;
        break;
      case 'baseball':
        iconData = Icons.sports_baseball;
        break;
      case 'volleyball':
        iconData = Icons.sports_volleyball;
        break;
      case 'hockey':
        iconData = Icons.sports_hockey;
        break;
      default:
        iconData = Icons.sports;
    }

    final Color themeColor = Color(
      int.parse(sport.themeColor.replaceFirst('#', '0xFF')),
    );

    return Icon(iconData, size: 24, color: themeColor);
  }
}
