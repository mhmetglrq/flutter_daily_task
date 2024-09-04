import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/constants/project_categories.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/items/colors.dart';
import '../../../../../config/routes/route_names.dart';
import '../../../../../config/utility/enum/svg_enum.dart';
import '../../../domain/entities/project.dart';
import '../../bloc/project/remote/remote_project_bloc.dart';
import '../../bloc/project/remote/remote_project_events.dart';
import '../../bloc/project/remote/remote_project_state.dart';
import '../../widgets/project/project_card.dart';
import '../../widgets/title_with_tree_dots.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  bool isLoading = true;
  @override
  void initState() {
    BlocProvider.of<RemoteProjectBloc>(context).add(const GetProjects());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Projects',
          style: context.textTheme.titleLarge?.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
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
              Expanded(
                child: Container(
                  color: AppColors.blackColor,
                ),
              ),
              Expanded(
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
                  Padding(
                    padding: context.paddingVerticalDefault,
                    child: TextField(
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
                  ),
                  Padding(
                    padding: context.paddingVerticalLow,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxHeight: context.dynamicHeight(0.075),
                          minHeight: context.dynamicHeight(0.03)),
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.53),
                        padEnds: false,
                        itemCount: projectCategories.length,
                        itemBuilder: (context, index) {
                          final category = projectCategories[index];
                          return Padding(
                            padding: context.paddingRightLow,
                            child: Container(
                              decoration: BoxDecoration(
                                color: category.color,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: context.paddingAllLow,
                                child: Text(
                                  category.title,
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    color: AppColors.titleTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const TitleWithThreeDots(
                    title: "Latest Project",
                    color: AppColors.whiteColor,
                  ),
                  BlocConsumer<RemoteProjectBloc, RemoteProjectState>(
                    listener: (context, state) {
                      if (state is ProjectDone) {
                        isLoading = false;
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: isLoading
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
