import 'package:flutter/material.dart';

import '../utils.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final EdgeInsets innerPadding;

  const BaseCard({
    Key? key,
    required this.child,
    this.backgroundColor = AppColors.surface,
    this.width,
    this.height,
    this.innerPadding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: innerPadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
