import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/items/app_colors.dart';
import '../../../../../config/routes/route_names.dart';
import '../../../../../config/utility/enum/svg_enum.dart';
import '../../../domain/entities/project.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
  });
  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Padding(
        padding: context.paddingVerticalLow,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                SvgConstants.latestProject.getSvg,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: context.paddingAllDefault,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.name ?? "Empty",
                        style: context.textTheme.labelLarge?.copyWith(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: context.paddingVerticalLow,
                        child: Text(
                          project.description ?? "Empty",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.turquoiseColor,
                          ),
                        ),
                      ),
                      const Spacer(), //TODO: Add percentage progress bar
                      Padding(
                        padding: context.paddingVerticalLow,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.projectDetail,
                              arguments: {
                                "project": project,
                              },
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: AppColors.yellowColor,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.dynamicWidth(0.05),
                              vertical: context.dynamicHeight(0.015),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Open Project",
                                  style: context.textTheme.labelMedium
                                      ?.copyWith(
                                          color: AppColors.titleTextColor),
                                ),
                                Padding(
                                  padding: context.paddingLeftLow,
                                  child: const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: AppColors.titleTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: context.paddingAllLow,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: context.dynamicHeight(0.14),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.whiteColor,
                                  radius: 20,
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.titleTextColor,
                                    child: Image.asset(
                                      "assets/images/profile_0.png",
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 32,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.whiteColor,
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: AppColors.titleTextColor,
                                      child: Image.asset(
                                        "assets/images/profile_1.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 64,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.whiteColor,
                                    radius: 20,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: AppColors.titleTextColor,
                                      child: Image.asset(
                                        "assets/images/profile_2.png",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            radius: 20,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.titleTextColor,
                              child: Text(
                                "3+",
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
