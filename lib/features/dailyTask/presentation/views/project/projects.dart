import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/constants/project_categories.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/items/app_colors.dart';
import '../../../../../config/routes/route_names.dart';
import '../../../../../config/utility/enum/svg_enum.dart';
import '../../../domain/entities/project.dart';
import '../../bloc/project/remote/project_bloc.dart';
import '../../bloc/project/remote/project_events.dart';
import '../../bloc/project/remote/project_state.dart';
import '../../widgets/project/project_card.dart';
import '../../widgets/title_with_tree_dots.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  late TextEditingController _searchController;

  @override
  void initState() {
    BlocProvider.of<ProjectBloc>(context).add(const FetchProjects());
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: !context.isKeyboardOpen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Projects',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
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
              onTap: () {
                Navigator.pushNamed(context, RouteNames.createProject);
              },
              child: SvgPicture.asset(
                SvgConstants.add.getSvg,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: context.dynamicHeight(0.5),
                  maxHeight: context.dynamicHeight(0.5),
                ),
                child: Container(
                  color: AppColors.blackColor,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: context.dynamicHeight(0.5),
                  maxHeight: context.dynamicHeight(0.5),
                ),
                child: Container(
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: context.paddingAllDefault,
              child: Column(
                children: [
                  //AppBarArea
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      return Padding(
                        padding: context.paddingVerticalDefault,
                        child: TextField(
                          onChanged: (value) {
                            BlocProvider.of<ProjectBloc>(context).add(
                              FetchProjects(
                                category: state.category,
                                projectName: value,
                              ),
                            );
                          },
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: context.dynamicWidth(0.05),
                              vertical: context.dynamicHeight(0.015),
                            ),
                            filled: true,
                            fillColor: AppColors.whiteColor,
                            hintText: "Find your project",
                            hintStyle: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.blackColor,
                            ),
                            prefixIcon: const Icon(
                              Icons.search_outlined,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<ProjectBloc, ProjectState>(
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
                            itemBuilder: (BuildContext context, int index) {
                              final category = projectCategories[index];

                              final selectedCategory = state.category;
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<ProjectBloc>(context).add(
                                    FetchProjects(
                                        category: category.title,
                                        projectName: _searchController.text),
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
                                      color: selectedCategory == category.title
                                          ? category.color
                                          : AppColors.whiteColor,
                                      border: Border.all(
                                        color:
                                            selectedCategory == category.title
                                                ? category.color
                                                : AppColors.blackColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    duration: const Duration(milliseconds: 400),
                                    child: Padding(
                                      padding: context.paddingAllDefault,
                                      child: Text(
                                        category.title,
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(
                                                color: AppColors.blackColor),
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
                  const TitleWithThreeDots(
                    title: "Latest Project",
                    color: AppColors.whiteColor,
                  ),
                  BlocBuilder<ProjectBloc, ProjectState>(
                    builder: (context, state) {
                      return Expanded(
                        child: state is ProjectLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive(),
                              )
                            : ListView.builder(
                                itemCount: state.projects?.length ?? 0,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final project = state.projects?[index];
                                  return ProjectCard(
                                    project: project ??
                                        const ProjectEntity(
                                          name: 'Creating Userflows',
                                          category: 'Category',
                                        ),
                                  );
                                },
                              ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
