import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/constants/task_categories.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/app_colors.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({super.key, required this.project});
  final ProjectEntity project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.whiteColor,
          ),
        ),
        actions: [
          Padding(
            padding: context.paddingRightDefault,
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.more_horiz_rounded,
                  color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  color: AppColors.blackColor,
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),

          //BODY
          SafeArea(
            child: Padding(
              padding: context.paddingAllDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name ?? "Empty",
                    style: context.textTheme.titleLarge
                        ?.copyWith(color: AppColors.whiteColor),
                  ),
                  Padding(
                    padding: context.paddingVerticalLow,
                    child: Text(
                      project.description ?? "Empty",
                      style: context.textTheme.bodyMedium
                          ?.copyWith(color: AppColors.whiteColor),
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(SvgConstants.calendar.getSvg),
                          Padding(
                            padding: context.paddingLeftLow,
                            child: Text(
                              "Date : ${DateFormat("dd MMM").format(project.deadline ?? DateTime.now())}",
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.whiteColor),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(SvgConstants.clock.getSvg),
                          Padding(
                            padding: context.paddingLeftLow,
                            child: Text(
                              "Time : ${DateFormat("HH:mm").format(project.deadline ?? DateTime.now())}",
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(color: AppColors.whiteColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: context.paddingTopDefault,
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              for (int i = 0; i < 6; i++)
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: i * context.dynamicWidth(0.1),
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.whiteColor,
                                    radius: 25,
                                    child: CircleAvatar(
                                        radius: 24,
                                        backgroundColor:
                                            AppColors.titleTextColor,
                                        child: Text(
                                          "M",
                                          style: context.textTheme.labelLarge
                                              ?.copyWith(
                                            color: AppColors.whiteColor,
                                          ),
                                        )),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.yellowColor,
                            child: CircleAvatar(
                              backgroundColor: AppColors.blackColor,
                              radius: 23,
                              child: Icon(
                                Icons.remove_red_eye_outlined,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.05),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: context.textTheme.titleLarge
                            ?.copyWith(color: AppColors.blackColor),
                      ),
                      Text(
                        "See More",
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  Padding(
                    padding: context.paddingVerticalLow,
                    child: SizedBox(
                      height: context.dynamicHeight(0.05),
                      child: ListView.builder(
                        itemCount: taskCategories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: context.paddingRightDefault,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: taskCategories[index].color,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.dynamicWidth(0.07),
                                ),
                                child: Text(
                                  taskCategories[index].title,
                                  style: context.textTheme.labelMedium
                                      ?.copyWith(color: AppColors.blackColor),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: context.paddingVerticalLow,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  taskCategories[index % taskCategories.length]
                                      .color,
                                  AppColors.whiteColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(
                                color: taskCategories[
                                        index % taskCategories.length]
                                    .color,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: context.paddingAllDefault,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Task $index",
                                    style: context.textTheme.bodyMedium
                                        ?.copyWith(color: AppColors.blackColor),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: taskCategories[
                                                index % taskCategories.length]
                                            .color,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
