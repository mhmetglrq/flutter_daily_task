import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

import '../../../../config/items/colors.dart';

class TextRowButton extends StatelessWidget {
  const TextRowButton({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onTap,
  });

  final String text;
  final String buttonText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: context.textTheme.labelMedium!.copyWith(
              color: AppColors.greyColor,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              buttonText,
              style: context.textTheme.labelMedium!.copyWith(
                color: AppColors.buttonColor,
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
