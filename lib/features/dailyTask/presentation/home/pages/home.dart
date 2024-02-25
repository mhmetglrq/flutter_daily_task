import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/constants/menu_items.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../config/items/colors.dart';
import '../../../../../config/utility/enum/svg_enum.dart';
import '../widgets/progress_card.dart';
import '../widgets/project_card.dart';
import '../widgets/project_indicator.dart';
import '../widgets/status_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            height: context.dynamicHeight(0.04),
            SvgConstants.menu.getSvg,
            colorFilter:
                const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: context.dynamicHeight(0.02),
              backgroundColor: AppColors.whiteColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          context.read<HomeBloc>().add(
                GetProjects(projects: state.projects),
              );
          return Padding(
            padding: context.paddingAllDefault,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Mehmet!",
                  style: context.textTheme.headlineMedium,
                ),
                Padding(
                  padding: context.paddingVerticalLow,
                  child: Text(
                    "Have a nice day.",
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: context.dynamicHeight(0.02),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: context.paddingVerticalDefault,
                    child: Row(
                      children: [
                        for (int i = 0; i < MenuItems.statusItems.length; i++)
                          StatusCard(
                            title: MenuItems.statusItems[i],
                            isActive: i == state.choosenValue,
                            onTap: () {
                              context.read<HomeBloc>().add(
                                    SetChosenValueEvent(choosenValue: i),
                                  );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.dynamicWidth(0.65),
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.projects.length,
                    padEnds: false,
                    onPageChanged: (value) {
                      context
                          .read<HomeBloc>()
                          .add(SetPageEvent(pageIndex: value));
                    },
                    itemBuilder: (context, index) {
                      final project = state.projects[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ProjectCard(
                            projectModel: project,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: context.dynamicWidth(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.38),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < state.projects.length; i++)
                              ProjectIndicator(
                                  pageIndex: i,
                                  totalPages: state.projects.length),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingVerticalLow,
                  child: Text(
                    "Progress",
                    style: context.textTheme.headlineMedium,
                  ),
                ),
                const ProgressCard(
                  title: "To Do",
                  subtitle: "5 tasks now. 1 started",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
