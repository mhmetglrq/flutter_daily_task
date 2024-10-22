import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/app_colors.dart';
import 'package:flutter_daily_task/config/utility/enum/svg_enum.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/task/remote/remote_task_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TaskCalendar extends StatefulWidget {
  const TaskCalendar({super.key});

  @override
  State<TaskCalendar> createState() => _TaskCalendarState();
}

class _TaskCalendarState extends State<TaskCalendar> {
  List<Map<String, dynamic>> getDaysOfWeek() {
    List<Map<String, dynamic>> daysOfWeek = [];
    DateTime now = DateTime.now();
    int currentDayOfWeek = now.weekday;
    for (int i = 1; i <= 7; i++) {
      int dayDifference = i - currentDayOfWeek;
      DateTime day = now.add(Duration(days: dayDifference));
      String dayName = DateFormat('E').format(day);
      daysOfWeek.add({
        "dayName": dayName,
        "dayNumber": day.day,
      });
    }
    return daysOfWeek;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> daysOfWeek = getDaysOfWeek();
    DateTime now = DateTime.now();
    return Scaffold(
      body: BlocBuilder<RemoteCalendarBloc, RemoteCalendarState>(
        builder: (context, state) {
          context.read<RemoteCalendarBloc>().add(
                GetTasksEvent(tasks: state.tasks),
              );
          return Column(
            children: [
              Container(
                height: context.dynamicHeight(0.32),
                decoration: const BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.02),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: context.paddingVerticalLow,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          SvgConstants.search.getSvg,
                          width: context.dynamicWidth(0.1),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${DateFormat('MMM').format(now)}, ${now.year}",
                          style: context.textTheme.titleMedium?.copyWith(
                            fontSize: context.dynamicHeight(0.03),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: AppColors.activeColor,
                          child: Row(
                            children: [
                              const Icon(Icons.add_rounded,
                                  color: AppColors.whiteColor),
                              Padding(
                                padding: context.paddingLeftLow,
                                child: Text(
                                  "Add Task",
                                  style: context.textTheme.labelMedium,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: context.paddingVerticalDefault,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: daysOfWeek.map((e) {
                          return Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<RemoteCalendarBloc>()
                                    .add(SetDayEvent(day: e));
                              },
                              child: Container(
                                width: context.dynamicWidth(0.13),
                                height: context.dynamicHeight(0.1),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: now.day == e["dayNumber"]
                                      ? AppColors.whiteColor.withOpacity(0.1)
                                      : state.day?["dayNumber"] ==
                                              e["dayNumber"]
                                          ? AppColors.activeColor
                                          : Colors.transparent,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e["dayName"],
                                      style: context.textTheme.labelMedium
                                          ?.copyWith(
                                        fontSize: context.dynamicHeight(0.02),
                                      ),
                                    ),
                                    Text(
                                      "${e["dayNumber"]}",
                                      style: context.textTheme.titleMedium
                                          ?.copyWith(
                                        fontSize: context.dynamicHeight(0.015),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: context.paddingAllDefault,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tasks",
                        style: context.textTheme.headlineMedium,
                      ),
                      if (state is CalendarError)
                        Text(
                          state.message!,
                          style: context.textTheme.labelMedium,
                        ),
                      if (state is CalendarLoaded)
                        Expanded(
                          child: state.tasks != null
                              ? ListView.builder(
                                  itemCount: state.tasks?.length,
                                  padding: context.paddingTopLow,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container();
                                  },
                                )
                              : const Center(
                                  child: Text("No Task"),
                                ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
