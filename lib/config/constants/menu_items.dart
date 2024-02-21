import 'package:flutter/material.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/home/presentation/pages/home.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/profile/pages/profile.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/project/pages/project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/taskCalendar/pages/task_calendar.dart';

class MenuItems {
  MenuItems._();

  static const List<String> statusItems = [
    'All',
    'Active',
    'Completed',
    'Archived',
    'Deleted',
    'Draft',
    'In Progress',
  ];

  static final List<Widget> bodyList = <Widget>[
    const Home(),
    const TaskCalendar(),
    const Project(),
    const Profile(),
  ];
}
