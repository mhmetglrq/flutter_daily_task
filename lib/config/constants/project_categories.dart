// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import '../items/app_colors.dart';

List<ProjectCategory> projectCategories = [
  ProjectCategory(
      title: "Software Development",
      color: AppColors.softwareDevCatColor,
      value: "software-dev"),
  ProjectCategory(
      title: "Design", color: AppColors.designCatColor, value: "design"),
  ProjectCategory(
      title: "Education",
      color: AppColors.educationCatColor,
      value: "education"),
  ProjectCategory(
      title: "Marketing",
      color: AppColors.marketingCatColor,
      value: "marketing"),
  ProjectCategory(
      title: "Business", color: AppColors.businessCatColor, value: "business"),
  ProjectCategory(
      title: "Finance", color: AppColors.financeCatColor, value: "finance"),
];

class ProjectCategory {
  String title;
  Color color;
  String value;
  ProjectCategory({
    required this.title,
    required this.color,
    required this.value,
  });
}
