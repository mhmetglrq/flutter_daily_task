// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import '../items/colors.dart';

List<ProjectCategories> projectCategories = [
  ProjectCategories(
      title: "Software Development",
      color: AppColors.softwareDevCatColor,
      value: "software-dev"),
  ProjectCategories(
      title: "Design", color: AppColors.designCatColor, value: "design"),
  ProjectCategories(
      title: "Education",
      color: AppColors.educationCatColor,
      value: "education"),
  ProjectCategories(
      title: "Marketing",
      color: AppColors.marketingCatColor,
      value: "marketing"),
  ProjectCategories(
      title: "Business", color: AppColors.businessCatColor, value: "business"),
  ProjectCategories(
      title: "Finance", color: AppColors.financeCatColor, value: "finance"),
];

class ProjectCategories {
  String title;
  Color color;
  String value;
  ProjectCategories({
    required this.title,
    required this.color,
    required this.value,
  });
}
