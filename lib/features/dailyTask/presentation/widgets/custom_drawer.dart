import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/items/app_colors.dart';
import '../../../../config/routes/route_names.dart';
import '../../../../config/utility/enum/svg_enum.dart';
import '../bloc/auth/remote/remote_auth_bloc.dart';
import '../bloc/auth/remote/remote_auth_event.dart';
import '../bloc/auth/remote/remote_auth_state.dart';
import '../bloc/home/remote/remote_home_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      // left: _isTap ? context.dynamicWidth(0.6) : context.dynamicWidth(0),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        child: Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.dynamicWidth(0.6),
              maxHeight: context.dynamicHeight(1),
            ),
            child: Padding(
              padding: context.paddingAllDefault,
              child: Column(
                children: [
                  DrawerHeader(
                    child: CircleAvatar(
                      radius: context.dynamicHeight(0.1),
                      backgroundColor: AppColors.blackColor,
                      child: Text(
                        "M"[0].toUpperCase(),
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Mehmet Guler",
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Divider(),
                  BlocBuilder<RemoteHomeBloc, RemoteHomeState>(
                    builder: (context, state) {
                      return Padding(
                        padding: context.paddingVerticalLow,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.blackColor,
                            ),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            leading:
                                SvgPicture.asset(SvgConstants.projects.getSvg),
                            title: Text(
                              "Projects",
                              style: context.textTheme.labelMedium?.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, RouteNames.projects);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: context.paddingVerticalLow,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.blackColor,
                        ),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: SvgPicture.asset(SvgConstants.tasks.getSvg),
                        title: Text(
                          "Tasks",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Divider(),
                  Padding(
                    padding: context.paddingVerticalLow,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.blackColor,
                        ),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: SvgPicture.asset(
                          SvgConstants.settings.getSvg,
                        ),
                        title: Text(
                          "Settings",
                          style: context.textTheme.labelMedium?.copyWith(
                            color: AppColors.blackColor,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  BlocBuilder<RemoteAuthBloc, RemoteAuthState>(
                    builder: (context, state) {
                      return Padding(
                        padding: context.paddingVerticalLow,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.blackColor,
                            ),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            leading: SvgPicture.asset(
                              SvgConstants.logout.getSvg,
                            ),
                            title: Text(
                              "Log Out",
                              style: context.textTheme.labelMedium?.copyWith(
                                color: AppColors.blackColor,
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<RemoteAuthBloc>(context)
                                  .add(RemoteSignOutEvent());
                              if (state is RemoteAuthDone) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    RouteNames.signIn, (route) => false);
                              } else {
                                log("Log out failed");
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
