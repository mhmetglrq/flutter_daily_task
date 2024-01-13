import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_daily_task/features/home/presentation/pages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _bodyList = <Widget>[
    const Home(),
    const Text(
      'Index 1: Calendar',
    ),
    const Text(
      'Index 2: Notification',
    ),
    const Text(
      'Index 3: Search',
    ),
  ];

  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
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
            label: 'Search',
            icon: SvgPicture.asset(
              height: context.dynamicHeight(0.04),
              SvgConstants.search.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.inactiveColor, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              height: context.dynamicHeight(0.04),
              SvgConstants.search.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.activeColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}