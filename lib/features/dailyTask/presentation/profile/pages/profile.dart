import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/constants/status_types.dart';
import 'package:flutter_daily_task/config/widget/title/colored_title.dart';

import '../../../../../config/utility/enum/svg_enum.dart';
import '../presentation/widgets/social_media_icon.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: context.dynamicHeight(0.1),
              ),
              Padding(
                padding: context.paddingVerticalLow,
                child: Text(
                  "John Doe",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontSize: context.dynamicHeight(0.025),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: context.paddingVerticalLow,
                child: Text(
                  "Software Engineer",
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: context.dynamicHeight(0.02),
                  ),
                ),
              ),
              Padding(
                padding: context.paddingVerticalLow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaIcon(
                      icon: SvgConstants.github.getSvg,
                      onTap: () {},
                    ),
                    SocialMediaIcon(
                      icon: SvgConstants.linkedin.getSvg,
                      onTap: () {},
                    ),
                    SocialMediaIcon(
                      icon: SvgConstants.stackOverflow.getSvg,
                      onTap: () {},
                    ),
                    SocialMediaIcon(
                      icon: SvgConstants.medium.getSvg,
                      onTap: () {},
                    ),
                    SocialMediaIcon(
                      icon: SvgConstants.web.getSvg,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: context.paddingVerticalLow,
                child: const ColoredTitle(
                  color: AppColors.periwinkle,
                  title: "Status",
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.07),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: statusTypes.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 5,
                        color: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        surfaceTintColor: AppColors.whiteColor,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            horizontal: context.dynamicWidth(0.065),
                            // vertical: context.dynamicHeight(0.02),
                          ),
                          child: Text(
                            statusTypes[index],
                            style: context.textTheme.headlineSmall!.copyWith(
                              color: AppColors.scaffoldColor,
                              fontSize: context.dynamicHeight(0.02),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: context.paddingVerticalLow,
                child: const ColoredTitle(
                  color: AppColors.periwinkle,
                  title: "About",
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: context.paddingAllLow,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteColor.withOpacity(0.1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Mon",
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: context.dynamicHeight(0.02),
                            ),
                          ),
                          Text(
                            "12",
                            style: context.textTheme.titleMedium?.copyWith(
                              fontSize: context.dynamicHeight(0.015),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
