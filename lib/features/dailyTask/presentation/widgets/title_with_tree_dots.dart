import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../config/items/app_colors.dart';

class TitleWithThreeDots extends StatelessWidget {
  const TitleWithThreeDots({
    super.key,
    required this.title,
    this.onTap,
    this.color = AppColors.whiteColor,
  });
  final String title;
  final Color? color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            radius: 50,
            onTap: onTap,
            child: Icon(
              Icons.more_horiz_outlined,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
