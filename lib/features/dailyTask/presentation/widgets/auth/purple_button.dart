import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../../config/items/colors.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefault,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        color: AppColors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: context.textTheme.labelMedium?.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
