import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../config/items/colors.dart';
import '../../../../../../config/utility/enum/svg_enum.dart';


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
                    child: Text(
                      "Project 1",
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontSize: context.dynamicHeight(0.023),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Front-End Development",
                style: context.textTheme.headlineMedium?.copyWith(
                  // fontSize: context.dynamicHeight(0.018),
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "October 20, 2020",
                style: context.textTheme.headlineSmall?.copyWith(
                  fontSize: context.dynamicHeight(0.018),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
