import 'dart:math';

import 'package:bmi_calculator/utils.dart';
import 'package:bmi_calculator/widgets/base_card.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  const ResultPage({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bmi = weight / pow(height / 100, 2);
    String bmiStatus;
    Color bmiStatusColor = Colors.orange;
    String note = "Your weight is healthy";
    if (bmi < 18.5) {
      bmiStatus = 'Underweight';
      note = "You need to eat more (increase your weight)";
    } else if (bmi < 24.9) {
      bmiStatus = 'Normal';
      bmiStatusColor = Colors.green;
    } else if (bmi < 29.9) {
      bmiStatus = 'Overweight';
      note = "You need to do more exercises";
    } else {
      bmiStatus = 'Obese';
      note = "You need to see a doctor";
      bmiStatusColor = Colors.red;
    }
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 24,
        backgroundColor: AppColors.background,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('RESULT'),
      ),
      body: Column(
        children: [
          const Expanded(child: SizedBox()),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: BaseCard(
                width: double.infinity,
                innerPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 48,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      bmiStatus,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: bmiStatusColor,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity / 2,
                      child: Text(
                        note,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          CalculateButton(
            onPressed: () {
              Navigator.pop(context);
            },
            label: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
