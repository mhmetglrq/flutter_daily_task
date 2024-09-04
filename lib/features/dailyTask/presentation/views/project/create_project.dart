import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/constants/project_categories.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/project/remote/remote_project_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/project/remote/remote_project_events.dart';
import 'package:intl/intl.dart';

import '../../bloc/project/remote/remote_project_state.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        color: AppColors.blackColor,
        child: Column(
          children: [
            Padding(
              padding: context.paddingAllDefault,
              child: Container(
                height: context.height * 0.71,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    SizedBox(height: context.dynamicHeight(0.03)),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Add Project",
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: AppColors.blackColor),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: context.paddingAllDefault,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title(context, "Title"),
                          Padding(
                            padding: context.paddingVerticalLow,
                            child: TextFormField(
                              controller: titleController,
                              decoration: InputDecoration(
                                hintText: "Enter Project Title",
                                hintStyle:
                                    context.textTheme.labelMedium?.copyWith(
                                  color: AppColors.blackColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          _title(context, "Description"),
                          Padding(
                            padding: context.paddingVerticalLow,
                            child: TextFormField(
                              controller: descriptionController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                hintText: "Enter project details",
                                hintStyle:
                                    context.textTheme.labelMedium?.copyWith(
                                  color: AppColors.blackColor,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          _title(context, "Category"),
                          BlocBuilder<RemoteProjectBloc, RemoteProjectState>(
                            builder: (context, state) {
                              return Padding(
                                padding: context.paddingVerticalLow,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxHeight: context.dynamicHeight(0.078),
                                      minHeight: context.dynamicHeight(0.05)),
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: projectCategories.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final category = projectCategories[index];
                                      final selectedCategory = state.category;
                                      return GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<RemoteProjectBloc>(
                                                  context)
                                              .add(
                                            ChooseCategory(
                                                category: category.title),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: context.dynamicWidth(0.05),
                                            top: context.dynamicHeight(0.01),
                                          ),
                                          child: AnimatedContainer(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: selectedCategory ==
                                                      category.title
                                                  ? category.color
                                                  : AppColors.whiteColor,
                                              border: Border.all(
                                                color: selectedCategory ==
                                                        category.title
                                                    ? category.color
                                                    : AppColors.blackColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            duration: const Duration(
                                                milliseconds: 400),
                                            child: Padding(
                                              padding:
                                                  context.paddingAllDefault,
                                              child: Text(
                                                category.title,
                                                style: context
                                                    .textTheme.bodySmall
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .blackColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title(context, "Date"),
                                    Padding(
                                      padding: context.paddingVerticalLow,
                                      child: TextFormField(
                                        controller: dateController,
                                        readOnly: true,
                                        showCursor: false,
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2025),
                                          ).then((value) {
                                            if (value != null) {
                                              dateController.text =
                                                  DateFormat("dd MMM yyyy")
                                                      .format(value);
                                            }
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "21 Nov 2021",
                                          hintStyle: context
                                              .textTheme.labelMedium
                                              ?.copyWith(
                                            color: AppColors.blackColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: context.dynamicWidth(0.05)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _title(context, "Time"),
                                    Padding(
                                      padding: context.paddingVerticalLow,
                                      child: TextFormField(
                                        controller: timeController,
                                        readOnly: true,
                                        showCursor: false,
                                        onTap: () {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then((value) {
                                            if (value != null) {
                                              timeController.text =
                                                  DateFormat("HH:mm").format(
                                                      DateTime(
                                                          2021,
                                                          1,
                                                          1,
                                                          value.hour,
                                                          value.minute));
                                            }
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: "11:00",
                                          hintStyle: context
                                              .textTheme.labelMedium
                                              ?.copyWith(
                                            color: AppColors.blackColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: context.paddingHorizontalHigh,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Assign To",
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: context.paddingTopDefault,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            for (int i = 0; i < 4; i++)
                              Padding(
                                padding: context.paddingRightLow,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteColor,
                                  radius: 25,
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: AppColors.titleTextColor,
                                    child: Image.asset(
                                      "assets/images/profile_0.png",
                                    ),
                                  ),
                                ),
                              ),
                          ],
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
                                Icons.add,
                                color: AppColors.yellowColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<RemoteProjectBloc, RemoteProjectState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.dynamicWidth(0.08),
                    vertical: context.dynamicHeight(0.025),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      final formattedDate =
                          DateFormat("dd MMM yyyy").parse(dateController.text);
                      final formattedTime =
                          DateFormat("HH:mm").parse(timeController.text);
                      DateTime deadline = DateTime(
                        formattedDate.year,
                        formattedDate.month,
                        formattedDate.day,
                        formattedTime.hour,
                        formattedTime.minute,
                      );
                      BlocProvider.of<RemoteProjectBloc>(context).add(
                        CreateProjectEvent(
                          project: ProjectEntity(
                            name: titleController.text,
                            description: descriptionController.text,
                            category: state.category,
                            createdAt: DateTime.now(),
                            deadline: deadline,
                          ),
                        ),
                      );
                    },
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: AppColors.yellowColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth(0.05),
                        vertical: context.dynamicHeight(0.015),
                      ),
                      child: state is ProjectLoading
                          ? const CircularProgressIndicator.adaptive()
                          : Text(
                              "Create Project",
                              style: context.textTheme.labelMedium
                                  ?.copyWith(color: AppColors.titleTextColor),
                            ),
                    ),
                  ),
                );
              },
              listener: (BuildContext context, RemoteProjectState state) {
                if (state is ProjectDone) {
                  log(state.projects.toString());
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Text _title(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
