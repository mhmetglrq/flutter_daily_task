import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';
import 'package:intl/intl.dart';

import '../../../../config/widget/title/colored_title.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          "Create a Task",
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: context.dynamicHeight(0.025),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.dynamicHeight(0.35),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: context.paddingHorizontalDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.dynamicHeight(0.12),
                  ),
                  Text(
                    "Name",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: context.dynamicHeight(0.02),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: context.paddingBottomLow,
                    child: TextFormField(
                      controller: _nameController,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Date",
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: context.dynamicHeight(0.02),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: context.paddingBottomLow,
                    child: TextFormField(
                      controller: _dateController,
                      onTap: () async {
                        await showDatePicker(
                          useRootNavigator: false,
                          barrierColor: AppColors.scaffoldColor,
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(20),
                          lastDate: DateTime(2025),
                          currentDate: DateTime.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: AppTheme.lightTheme,
                              child: child!,
                            );
                          },
                        ).then(
                          (value) {
                            if (value != null) {
                              _dateController.text =
                                  DateFormat("dd MMMM yyyy").format(value);
                            }
                          },
                        );
                      },
                      readOnly: true,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: context.paddingAllDefault,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Time",
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.periwinkle,
                                fontSize: context.dynamicHeight(0.02),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "01.22 PM",
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: context.dynamicHeight(0.03),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "End Time",
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.periwinkle,
                                fontSize: context.dynamicHeight(0.02),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              "03.20 PM",
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.whiteColor,
                                fontSize: context.dynamicHeight(0.03),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: context.paddingVerticalDefault,
                      child: const Divider(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const ColoredTitle(
                      title: "Description",
                      color: AppColors.periwinkle,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.periwinkle,
                        fontSize: context.dynamicHeight(0.018),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: context.paddingVerticalDefault,
                      child: const Divider(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const ColoredTitle(
                        color: AppColors.periwinkle, title: "Category"),
                    SizedBox(
                      height: context.dynamicHeight(0.08),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            {"name": "Design", "isActive": false},
                            {"name": "Meeting", "isActive": true},
                            {"name": "Coding", "isActive": false},
                            {"name": "Testing", "isActive": false},
                            {"name": "Bug Fix", "isActive": false},
                            {"name": "Deployment", "isActive": false}
                          ].map((e) {
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: context.paddingRightDefault,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: e["isActive"] == true
                                        ? AppColors.activeColor
                                        : AppColors.containerColor,
                                  ),
                                  child: Padding(
                                    padding: context.paddingAllLow,
                                    child: Text(
                                      "${e["name"]}",
                                      style: context.textTheme.titleMedium
                                          ?.copyWith(
                                        color: AppColors.whiteColor,
                                        fontSize: context.dynamicHeight(0.018),
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
