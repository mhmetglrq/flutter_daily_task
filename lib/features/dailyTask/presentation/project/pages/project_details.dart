import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/widgets/project_status_card.dart';
import 'package:intl/intl.dart';

import '../../../../../config/widget/title/colored_title.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key, required this.project});
  final ProjectEntity project;

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.project.name!;
    _dateController.text =
        DateFormat("dd MMMM yyyy").format(widget.project.createdAt!);
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
          "Project Details",
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
                    child: Text(
                      "${widget.project.name}",
                      maxLines: 2,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.whiteColor,
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
                    child: Text(
                      "${widget.project.deadline}",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.whiteColor,
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
                              DateFormat("hh:mm")
                                  .format(widget.project.createdAt!),
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
                              DateFormat("hh:mm").format(
                                  widget.project.deadline ?? DateTime.now()),
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
                      "${widget.project.description}",
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
                        color: AppColors.periwinkle, title: "Status"),
                    SizedBox(
                      height: context.dynamicHeight(0.08),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ProjectStatusCard(
                          color: AppColors.activeColor,
                          name: "${widget.project.status?.value}",
                        ),
                      ),
                    ),
                    Padding(
                      padding: context.paddingVerticalDefault,
                      child: const Divider(
                        color: AppColors.whiteColor,
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