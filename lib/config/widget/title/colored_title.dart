import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

class ColoredTitle extends StatelessWidget {
  const ColoredTitle({
    super.key,
    required this.color,
    required this.title,
  });
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalLow,
      child: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          color: color,
          fontSize: context.dynamicHeight(0.02),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
