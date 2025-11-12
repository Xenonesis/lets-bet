import 'package:flutter/material.dart';
import '../../../core/models/sport.dart';

class SportCard extends StatelessWidget {
  final Sport sport;
  final VoidCallback? onTap;

  const SportCard({
    super.key,
    required this.sport,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Color(int.parse(sport.themeColor.replaceFirst('#', '0xFF')));
    
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                themeColor.withOpacity(0.1),
                themeColor.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Sport Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: _getSportIcon(sport.code),
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Sport Name
              Expanded(
                child: Text(
                  sport.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: themeColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              
              // Arrow
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: themeColor,
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
    
    final Color themeColor = Color(int.parse(sport.themeColor.replaceFirst('#', '0xFF')));
    
    return Icon(
      iconData,
      size: 24,
      color: themeColor,
    );
  }
}