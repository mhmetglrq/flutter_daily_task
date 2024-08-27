import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/utility/enum/image_enums.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../config/items/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
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
                  Padding(
                    padding: context.paddingVerticalLow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Text(
                              'Shashi',
                              style: context.textTheme.labelLarge?.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Builder(
                          builder: (context) {
                            return InkWell(
                              onTap: () {
                                Scaffold.of(context).openEndDrawer();
                              },
                              radius: 50,
                              child: SvgPicture.asset(
                                SvgConstants.menu.getSvg,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.whiteColor, BlendMode.srcIn),
                              ),
                            );
                          },
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
                  TitleWithThreeDots(
                    title: 'Categories',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.3),
                    child: PageView.builder(
                      controller: PageController(viewportFraction: 0.53),
                      padEnds: false,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            SvgPicture.asset(
                              SvgConstants.projectCategory.getSvg,
                            ),
                            Padding(
                              padding: context.paddingAllDefault,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Category $index',
                                    style:
                                        context.textTheme.labelLarge?.copyWith(
                                      color: AppColors.titleTextColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: context.paddingVerticalLow,
                                    child: Text(
                                      '12 tasks',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: AppColors.titleTextColor,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: context.paddingVerticalLow,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'More Info',
                                          style: context.textTheme.labelLarge
                                              ?.copyWith(
                                            color: AppColors.titleTextColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding: context.paddingAllLow,
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              color: AppColors.containerColor,
                                              child: Padding(
                                                padding: context.paddingAllLow,
                                                child: const Icon(
                                                  Icons.arrow_forward_outlined,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const TitleWithThreeDots(
                    title: "Latest Project",
                    color: AppColors.titleTextColor,
                  ),
                  Expanded(
                    child: Padding(
                      padding: context.paddingVerticalLow,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: SvgPicture.asset(
                              SvgConstants.latestProject.getSvg,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: context.paddingAllDefault,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Creating Userflows',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                        color: AppColors.yellowColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: context.paddingVerticalLow,
                                      child: Text(
                                        'Category',
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(
                                          color: AppColors.turquoiseColor,
                                        ),
                                      ),
                                    ),
                                    const Spacer(), //TODO: Add percentage progress bar

                                    Padding(
                                      padding: context.paddingVerticalLow,
                                      child: MaterialButton(
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        color: AppColors.yellowColor,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                context.dynamicWidth(0.05),
                                            vertical:
                                                context.dynamicHeight(0.015),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Open Project",
                                                style: context
                                                    .textTheme.labelMedium
                                                    ?.copyWith(
                                                        color: AppColors
                                                            .titleTextColor),
                                              ),
                                              Padding(
                                                padding: context.paddingLeftLow,
                                                child: const Icon(
                                                  Icons.arrow_forward_outlined,
                                                  color:
                                                      AppColors.titleTextColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: context.paddingAllLow,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: context.dynamicHeight(0.14),
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    AppColors.whiteColor,
                                                radius: 20,
                                                child: CircleAvatar(
                                                  radius: 18,
                                                  backgroundColor:
                                                      AppColors.titleTextColor,
                                                  child: Image.asset(
                                                    "assets/images/profile_0.png",
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 32,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.whiteColor,
                                                  radius: 20,
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor: AppColors
                                                        .titleTextColor,
                                                    child: Image.asset(
                                                      "assets/images/profile_1.png",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 64,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.whiteColor,
                                                  radius: 20,
                                                  child: CircleAvatar(
                                                    radius: 18,
                                                    backgroundColor: AppColors
                                                        .titleTextColor,
                                                    child: Image.asset(
                                                      "assets/images/profile_2.png",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          backgroundColor: AppColors.whiteColor,
                                          radius: 20,
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor:
                                                AppColors.titleTextColor,
                                            child: Text(
                                              "3+",
                                              style: context.textTheme.bodySmall
                                                  ?.copyWith(
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

class TitleWithThreeDots extends StatelessWidget {
  const TitleWithThreeDots({
    super.key,
    required this.title,
    this.onTap,
    this.color = AppColors.whiteColor,
  });
  final String title;
  final Color? color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            radius: 50,
            onTap: onTap,
            child: Icon(
              Icons.more_horiz_outlined,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
