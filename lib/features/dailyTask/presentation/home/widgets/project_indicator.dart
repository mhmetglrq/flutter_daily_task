import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/home/bloc/home_bloc.dart';

class ProjectIndicator extends StatelessWidget {
  const ProjectIndicator(
      {super.key, required this.pageIndex, required this.totalPages});
  final int pageIndex;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: state.pageIndex == pageIndex
                  ? AppColors.activeColor
                  : AppColors.whiteColor),
          width: state.pageIndex == pageIndex
              ? MediaQuery.of(context).size.width / (totalPages * 4)
              : MediaQuery.of(context).size.width / (totalPages * 15),
          height: 6,
        );
      },
    );
  }
}
