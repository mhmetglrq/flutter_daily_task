import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/constants/menu_items.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/bottom_navbar_bloc.dart';
import '../bloc/bottom_navbar_event.dart';
import '../bloc/bottom_navbar_state.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
        builder: (context, state) {
          return Scaffold(
            body: MenuItems.bodyList[state.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (index) {
                context.read<BottomNavbarBloc>().add(SetPageIndexEvent(
                    pageIndex: index, message: "index changed"));
              },
              useLegacyColorScheme: false,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.home.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.inactiveColor, BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.home.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.activeColor, BlendMode.srcIn),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Calendar',
                  icon: SvgPicture.asset(
                    SvgConstants.calendar.getSvg,
                    height: context.dynamicHeight(0.04),
                    colorFilter: const ColorFilter.mode(
                        AppColors.inactiveColor, BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.calendar.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.activeColor, BlendMode.srcIn),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Notification',
                  icon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.notification.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.inactiveColor, BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.notification.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.activeColor, BlendMode.srcIn),
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.person.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.inactiveColor, BlendMode.srcIn),
                  ),
                  activeIcon: SvgPicture.asset(
                    height: context.dynamicHeight(0.04),
                    SvgConstants.person.getSvg,
                    colorFilter: const ColorFilter.mode(
                        AppColors.activeColor, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
