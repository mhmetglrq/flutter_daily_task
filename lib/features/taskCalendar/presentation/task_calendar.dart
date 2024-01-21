import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';

class TaskCalendar extends StatefulWidget {
  const TaskCalendar({super.key});

  @override
  State<TaskCalendar> createState() => _TaskCalendarState();
}

class _TaskCalendarState extends State<TaskCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: const Center(
            child: Text("Task Calendar"),
          ),
        ),
      ),
    );
  }
}
