import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../config/items/colors.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: isActive ? 5 : 0,
        color: isActive ? AppColors.whiteColor : AppColors.lavenderColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        surfaceTintColor:
            isActive ? AppColors.whiteColor : AppColors.lavenderColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.065),
            vertical: context.dynamicHeight(0.02),
          ),
          child: Text(
            title,
            style: context.textTheme.headlineSmall!.copyWith(
              color: isActive ? AppColors.scaffoldColor : AppColors.grayColor,
              fontSize: context.dynamicHeight(0.018),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
