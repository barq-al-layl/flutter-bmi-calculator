import 'package:bmi_calculator/utils.dart';
import 'package:flutter/material.dart';

import 'base_card.dart';

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color iconColor;
  final VoidCallback onSelected;

  const GenderCard({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.iconColor,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: BaseCard(
        backgroundColor:
            isSelected ? AppColors.surface : AppColors.surfaceVariant,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 96,
              color: isSelected ? iconColor : Colors.white,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 24,
                color: AppColors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
