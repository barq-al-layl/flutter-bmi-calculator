import 'package:bmi_calculator/widgets/base_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class HeightCard extends StatelessWidget {
  final double value;
  final Function(double) onChanged;

  const HeightCard({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final double start = 120;
  final double end = 200;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'HEIGHT',
            style: TextStyle(
              fontSize: 24,
              color: AppColors.grey,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${value.toInt()}',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 2),
              const Text(
                'cm',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: Slider(
              value: value,
              onChanged: onChanged,
              min: start,
              max: end,
              divisions: (end - start).toInt(),
              activeColor: Colors.grey[700],
              inactiveColor: Colors.grey[800],
              thumbColor: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
