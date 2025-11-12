import 'package:flutter/material.dart';
import '../../../core/models/betting.dart';

class BetSlipItemCard extends StatefulWidget {
  final BetSlipItem item;
  final BetType betType;
  final Function(double) onStakeChanged;
  final VoidCallback onRemove;

  const BetSlipItemCard({
    super.key,
    required this.item,
    required this.betType,
    required this.onStakeChanged,
    required this.onRemove,
  });

  @override
  State<BetSlipItemCard> createState() => _BetSlipItemCardState();
}

class _BetSlipItemCardState extends State<BetSlipItemCard> {
  late TextEditingController _stakeController;

  @override
  void initState() {
    super.initState();
    _stakeController = TextEditingController(
      text: widget.item.stake?.toStringAsFixed(2) ?? '',
    );
  }

  @override
  void dispose() {
    _stakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with remove button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.item.matchName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: widget.onRemove,
                  icon: const Icon(Icons.close, size: 18),
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
            
            const SizedBox(height: 8),
            
            // Market and outcome
            Text(
              '${widget.item.marketName}: ${widget.item.outcomeName}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            
            const SizedBox(height: 8),
            
            // Odds and stake
            Row(
              children: [
                // Odds
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.item.odds.toStringAsFixed(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Stake input (only for single bets)
                if (widget.betType == BetType.single) ...[
                  Expanded(
                    child: TextFormField(
                      controller: _stakeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Stake',
                        prefixText: '₹',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                      ),
                      style: const TextStyle(fontSize: 14),
                      onChanged: (value) {
                        final stake = double.tryParse(value) ?? 0.0;
                        widget.onStakeChanged(stake);
                      },
                    ),
                  ),
                  
                  const SizedBox(width: 8),
                  
                  // Potential win for single bet
                  if (widget.item.stake != null && widget.item.stake! > 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Win',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '₹${(widget.item.stake! * widget.item.odds).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                ],
              ],
            ),
            
            // Minimum stake warning
            if (widget.item.stake != null && widget.item.stake! < 1.0)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Minimum stake: ₹1.00',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.red[600],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}