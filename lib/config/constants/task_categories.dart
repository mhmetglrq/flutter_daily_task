// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import '../items/app_colors.dart';

List<TaskCategory> taskCategories = [
  TaskCategory(title: "Coding", color: AppColors.codingTaskColor),
  TaskCategory(title: "Bug Fix", color: AppColors.bugFixTaskColor),
  TaskCategory(title: "Design", color: AppColors.designTaskColor),
  TaskCategory(title: "Testing", color: AppColors.testingTaskColor),
  TaskCategory(title: "Meeting", color: AppColors.meetingTaskColor),
  TaskCategory(title: "Deployment", color: AppColors.deploymentTaskColor),
];

class TaskCategory {
  String title;
  Color color;
  TaskCategory({
    required this.title,
    required this.color,
  });
}
