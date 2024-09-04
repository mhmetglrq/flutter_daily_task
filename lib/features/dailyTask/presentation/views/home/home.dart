import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../config/items/colors.dart';
import '../../bloc/auth/remote/remote_auth_bloc.dart';
import '../../bloc/auth/remote/remote_auth_state.dart';
import '../../bloc/home/remote/remote_home_bloc.dart';
import '../../mixins/home_mixin.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/home/category_card.dart';
import '../../widgets/project/project_card.dart';
import '../../widgets/title_with_tree_dots.dart';

//TODO: Create a new widget for searchbar. Also we need to create a new widget for the background.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.dynamicWidth(1),
            height: context.dynamicHeight(1),
          ),
          const CustomDrawer(),
          BlocBuilder<RemoteHomeBloc, RemoteHomeState>(
            builder: (context, state) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                right: initialPosition,
                child: GestureDetector(
                  onHorizontalDragUpdate: handleDragUpdate,
                  onHorizontalDragEnd: handleDragEnd,
                  onTap: handleBodyTap,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: context.dynamicWidth(1),
                      minWidth: context.dynamicWidth(1),
                      maxHeight: context.dynamicHeight(1),
                    ),
                    child: Stack(
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
                                Padding(
                                  padding: context.paddingVerticalLow,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlocBuilder<RemoteAuthBloc,
                                          RemoteAuthState>(
                                        builder: (context, state) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Hello,',
                                                style: context
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                state.user?.name ??
                                                    "Kullanıcı adı",
                                                style: context
                                                    .textTheme.labelLarge
                                                    ?.copyWith(
                                                  color: AppColors.whiteColor,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      InkWell(
                                        onTap: handleDrawerTap,
                                        radius: 50,
                                        child: SvgPicture.asset(
                                          SvgConstants.menu.getSvg,
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.whiteColor,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: context.paddingVerticalDefault,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: context.dynamicWidth(0.05),
                                        vertical: context.dynamicHeight(0.015),
                                      ),
                                      filled: true,
                                      fillColor: AppColors.whiteColor,
                                      hintText: "Find your task",
                                      hintStyle: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.blackColor,
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search_outlined,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                  ),
                                ),
                                TitleWithThreeDots(
                                  title: 'Categories',
                                  onTap: () {},
                                ),
                                BlocBuilder<RemoteHomeBloc, RemoteHomeState>(
                                  builder: (context, state) {
                                    BlocProvider.of<RemoteHomeBloc>(context)
                                        .add(const GetStatusEvent());
                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxHeight:
                                              context.dynamicHeight(0.25),
                                          minHeight:
                                              context.dynamicHeight(0.25)),
                                      child: PageView.builder(
                                        controller: PageController(
                                            viewportFraction: 0.53),
                                        padEnds: false,
                                        itemCount: state.status?.length ?? 0,
                                        itemBuilder: (context, index) {
                                          final status = state.status?[index];
                                          return CategoryCard(status: status);
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const TitleWithThreeDots(
                                  title: "Latest Project",
                                  color: AppColors.titleTextColor,
                                ),
                                const Expanded(
                                    child: ProjectCard(
                                  project: ProjectEntity(
                                    name: 'Creating Userflows',
                                    category: 'Category',
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
