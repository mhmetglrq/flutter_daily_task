import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';

class ProjectStatusCard extends StatelessWidget {
  const ProjectStatusCard({super.key, required this.color, required this.name});
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: context.paddingRightDefault,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Padding(
            padding: context.paddingAllLow,
            child: Text(
              name,
              style: context.textTheme.titleMedium?.copyWith(
                color: AppColors.whiteColor,
                fontSize: context.dynamicHeight(0.018),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
