import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../config/items/colors.dart';
import '../../../../../../config/utility/enum/svg_enum.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingBottomLow,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth(0.05),
            vertical: context.dynamicHeight(0.02),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [AppColors.activeColor, AppColors.blueColor],
                    // stops: [0.3, 8.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: context.paddingAllDefault,
                  child: SvgPicture.asset(
                    SvgConstants.todoList.getSvg,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: context.paddingHorizontalDefault,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "To-Do List",
                        style: context.textTheme.headlineSmall?.copyWith(
                          color: AppColors.scaffoldColor,
                          fontSize: context.dynamicHeight(0.023),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Front-End Development",
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: context.dynamicHeight(0.018),
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  SvgConstants.threeDots.getSvg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
