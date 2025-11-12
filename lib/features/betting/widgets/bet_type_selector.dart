import 'package:flutter/material.dart';
import '../../../core/models/betting.dart';

class BetTypeSelector extends StatelessWidget {
  final BetType selectedType;
  final Function(BetType) onTypeChanged;

  const BetTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: _BetTypeOption(
              type: BetType.single,
              isSelected: selectedType == BetType.single,
              onTap: () => onTypeChanged(BetType.single),
            ),
          ),
          Expanded(
            child: _BetTypeOption(
              type: BetType.multiple,
              isSelected: selectedType == BetType.multiple,
              onTap: () => onTypeChanged(BetType.multiple),
            ),
          ),
        ],
      ),
    );
  }
}

class _BetTypeOption extends StatelessWidget {
  final BetType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _BetTypeOption({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String label = type == BetType.single ? 'Single' : 'Multiple';
    final String description = type == BetType.single 
        ? 'One bet per selection' 
        : 'Combine all selections';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey[700],
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: TextStyle(
                color: isSelected ? Colors.white70 : Colors.grey[500],
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}