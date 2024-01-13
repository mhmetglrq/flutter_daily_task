import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _bodyList = <Widget>[
    const Text(
      'Index 0: Home',
    ),
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
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgConstants.home.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.inactiveColor, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              SvgConstants.home.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.activeColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgConstants.calendar.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.inactiveColor, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              SvgConstants.calendar.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.activeColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgConstants.notification.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.inactiveColor, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              SvgConstants.notification.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.activeColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgConstants.search.getSvg,
              colorFilter: const ColorFilter.mode(
                  AppColors.inactiveColor, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
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
