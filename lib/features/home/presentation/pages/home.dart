import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/items/colors.dart';
import '../../../../config/utility/enum/svg_enum.dart';
import '../widgets/status_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    AppColors.titleTextColor, BlendMode.srcIn),
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
              backgroundColor: AppColors.titleTextColor,
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
            const Text(
              "Hello Mehmet!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.titleTextColor,
              ),
            ),
            Padding(
              padding: context.paddingVerticalLow,
              child: Text(
                "Have a nice day.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.titleTextColor.withOpacity(0.5),
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
            Column(
              children: [
                Container(
                  width: context.dynamicWidth(0.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [AppColors.activeColor, AppColors.blueColor],
                      // stops: [0.3, 8.0],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: context.paddingAllDefault,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(SvgConstants.projects.getSvg),
                              Padding(
                                padding: context.paddingHorizontalDefault,
                                child: const Text(
                                  "Project 1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Front-End Development",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            "October 20, 2020",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
