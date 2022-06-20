import 'package:flutter/material.dart';

import '../utils.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CalculateButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.secondary),
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 64),
        ),
      ),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(fontSize: 28)),
    );
  }
}
