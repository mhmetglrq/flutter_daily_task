import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/items/colors.dart';
import '../../../../config/utility/enum/svg_enum.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [AppColors.activeColor, AppColors.blueColor],
          // stops: [0.3, 8.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(SvgConstants.projects.getSvg),
                  Padding(
                    padding: context.paddingHorizontalDefault,
                    child: const Text(
                      "Project 1",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "Front-End Development",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                "October 20, 2020",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
