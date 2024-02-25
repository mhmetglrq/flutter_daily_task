import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../../config/items/colors.dart';
import '../../../../../config/utility/enum/svg_enum.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.projectModel,
  });

  final ProjectEntity projectModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [AppColors.activeColor, AppColors.blueColor],
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
                      "${projectModel.description}",
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontSize: context.dynamicHeight(0.023),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${projectModel.description}",
                style: context.textTheme.headlineMedium?.copyWith(
                  // fontSize: context.dynamicHeight(0.018),
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                DateFormat("dd.MM.yyyy").format(projectModel.createdAt!),
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
