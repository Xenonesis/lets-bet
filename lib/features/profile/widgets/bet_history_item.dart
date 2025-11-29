import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/models/betting.dart';

class BetHistoryItem extends StatelessWidget {
  final Bet bet;

  const BetHistoryItem({super.key, required this.bet});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = _getStatusColor(bet.status);
    final String statusText = _getStatusText(bet.status);
    final String dateText = DateFormat('MMM dd, yyyy HH:mm').format(bet.placedAt);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${bet.type == BetType.single ? 'Single' : 'Multiple'} Bet',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Date and Bet ID
            Text(
              dateText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              'Bet ID: ${bet.id}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Selections count
            if (bet.selections.isNotEmpty)
              Text(
                '${bet.selections.length} selection${bet.selections.length > 1 ? 's' : ''}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            
            const SizedBox(height: 12),
            
            // Amount details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stake',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '₹${bet.totalStake.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      bet.status == BetStatus.won ? 'Won' : 'Potential Win',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '₹${(bet.actualWin ?? bet.potentialWin).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: bet.status == BetStatus.won ? Colors.green : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Cash out value if applicable
            if (bet.cashOutValue != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cashed Out',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '₹${bet.cashOutValue!.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
  
  Color _getStatusColor(BetStatus status) {
    switch (status) {
      case BetStatus.won:
        return Colors.green;
      case BetStatus.lost:
        return Colors.red;
      case BetStatus.pending:
      case BetStatus.placed:
        return Colors.orange;
      case BetStatus.voided:
        return Colors.grey;
      case BetStatus.cashedOut:
        return Colors.blue;
    }
  }
  
  String _getStatusText(BetStatus status) {
    switch (status) {
      case BetStatus.won:
        return 'Won';
      case BetStatus.lost:
        return 'Lost';
      case BetStatus.pending:
        return 'Pending';
      case BetStatus.placed:
        return 'Active';
      case BetStatus.voided:
        return 'Voided';
      case BetStatus.cashedOut:
        return 'Cashed Out';
    }
  }
}