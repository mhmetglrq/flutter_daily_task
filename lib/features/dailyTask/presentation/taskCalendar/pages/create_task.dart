import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/category.dart';
import 'package:flutter_daily_task/features/dailyTask/data/model/user.dart';
import 'package:intl/intl.dart';

import '../../../../../config/widget/title/colored_title.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _startDate;
  String? _endDate;
  List<CategoryModel> choosenCategories = [];
  List<UserModel> choosenUsers = [];

  @override
  void dispose() {
    _dateController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void addCategoryItem(CategoryModel item) {
    if (choosenCategories.contains(item)) {
      choosenCategories.remove(item);
    } else {
      choosenCategories.add(item);
    }
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
                        GestureDetector(
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
                                  setState(() {
                                    _startDate =
                                        DateFormat("dd.MM.y").format(value);
                                  });
                                }
                              },
                            );
                          },
                          child: Column(
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
                                _startDate ?? "",
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: context.dynamicHeight(0.03),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
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
                                  setState(() {
                                    _endDate =
                                        DateFormat("dd.MM.y").format(value);
                                  });
                                }
                              },
                            );
                          },
                          child: Column(
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
                                _endDate ?? "",
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: context.dynamicHeight(0.03),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
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
                    TextFormField(
                      maxLines: 5,
                      controller: _descriptionController,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.periwinkle,
                        fontSize: context.dynamicHeight(0.018),
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: InputDecoration(
                        hintText: "Write a description",
                        hintStyle: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.periwinkle,
                          fontSize: context.dynamicHeight(0.018),
                          fontWeight: FontWeight.w300,
                        ),
                        border: InputBorder.none,
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
                            const CategoryModel(
                              uid: "1",
                              value: "Design",
                            ),
                            const CategoryModel(
                              uid: "2",
                              value: "Development",
                            ),
                            const CategoryModel(
                              uid: "3",
                              value: "Marketing",
                            ),
                            const CategoryModel(
                              uid: "4",
                              value: "Management",
                            ),
                            const CategoryModel(
                              uid: "5",
                              value: "Finance",
                            ),
                          ].map((e) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  addCategoryItem(e);
                                });
                              },
                              child: Padding(
                                padding: context.paddingRightDefault,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: choosenCategories.contains(e)
                                        ? AppColors.activeColor
                                        : AppColors.containerColor,
                                  ),
                                  child: Padding(
                                    padding: context.paddingAllLow,
                                    child: Text(
                                      "${e.value}",
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
                    Padding(
                      padding: context.paddingVerticalDefault,
                      child: const Divider(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Padding(
                      padding: context.paddingVerticalDefault,
                      child: SizedBox(
                        width: double.infinity,
                        height: context.dynamicHeight(0.06),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.activeColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Create Project",
                            style: context.textTheme.titleMedium?.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: context.dynamicHeight(0.02),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
