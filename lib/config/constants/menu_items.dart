import 'package:flutter/material.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/home/home.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/profile/profile.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/project/project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/views/task/task_calendar.dart';

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
