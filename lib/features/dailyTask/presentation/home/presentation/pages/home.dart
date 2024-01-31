import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../config/items/colors.dart';
import '../../../../../../config/utility/enum/svg_enum.dart';
import '../bloc/home_bloc.dart';
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
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: SvgPicture.asset(
                height: context.dynamicHeight(0.04),
                SvgConstants.menu.getSvg,
                colorFilter: const ColorFilter.mode(
                    AppColors.whiteColor, BlendMode.srcIn),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
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
      body: Padding(
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
                child: const Row(
                  children: [
                    StatusCard(
                      title: "My Task",
                      isActive: true,
                    ),
                    StatusCard(
                      title: "In-progress",
                      isActive: false,
                    ),
                    StatusCard(
                      title: "Completed",
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: context.dynamicWidth(0.65),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 4,
                    padEnds: false,
                    onPageChanged: (value) {
                      context
                          .read<HomeBloc>()
                          .add(SetPageEvent(pageIndex: value));
                    },
                    itemBuilder: (context, value) {
                      return const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ProjectCard(),
                        ],
                      );
                    },
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
                        for (int i = 0; i < 4; i++)
                          ProjectIndicator(pageIndex: i, totalPages: 4),
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
            const ProgressCard()
          ],
        ),
      ),
    );
  }
}
