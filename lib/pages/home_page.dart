import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/utils.dart';
import 'package:bmi_calculator/widgets/gender_card.dart';
import 'package:bmi_calculator/widgets/height_card.dart';
import 'package:bmi_calculator/widgets/property_card.dart';
import 'package:flutter/material.dart';

import '../widgets/calculate_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender gender = Gender.Male;
  int height = 168;
  int weight = 65;
  int age = 25;

  void onHeightChange(double newHeight) {
    setState(() {
      height = newHeight.toInt();
    });
  }

  Route showResult() {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => ResultPage(
        height: height,
        weight: weight,
      ),
      transitionsBuilder: (_, animation, ___, child) {
        final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 24,
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: GenderCard(
                      label: 'MALE',
                      icon: Icons.male,
                      isSelected: gender == Gender.Male,
                      iconColor: Colors.blue,
                      onSelected: () => setState(() {
                        gender = Gender.Male;
                      }),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GenderCard(
                      label: 'FEMALE',
                      icon: Icons.female,
                      isSelected: gender == Gender.Female,
                      iconColor: Colors.pink,
                      onSelected: () => setState(() {
                        gender = Gender.Female;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: HeightCard(
                value: height.toDouble(),
                onChanged: onHeightChange,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: PropertyCard(
                      label: 'WEIGHT',
                      value: weight,
                      onIncrement: () => setState(() {
                        weight++;
                      }),
                      onDecrement: () => setState(() {
                        weight--;
                      }),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PropertyCard(
                      label: 'AGE',
                      value: age,
                      onIncrement: () => setState(() {
                        age++;
                      }),
                      onDecrement: () => setState(() {
                        age--;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            onPressed: () {
              Navigator.push(context, showResult());
            },
            label: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
