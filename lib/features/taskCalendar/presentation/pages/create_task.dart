import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Create Task",
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.white,
            fontSize: context.dynamicHeight(0.025),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.dynamicHeight(0.32),
            color: AppColors.containerColor,
            padding: context.paddingAllLow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontSize: context.dynamicHeight(0.02),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: context.paddingBottomLow,
                  child: TextField(
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: context.dynamicHeight(0.016),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  "Date",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontSize: context.dynamicHeight(0.02),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: context.paddingBottomLow,
                  child: TextField(
                    onTap: () async {
                      await showDatePicker(
                        barrierColor: AppColors.scaffoldColor,
                        context: context,
                        initialDate: DateTime.now(),
                        
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2025),
                        currentDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: AppTheme.lightTheme.copyWith(
                              datePickerTheme: DatePickerThemeData(
                                backgroundColor: AppColors.scaffoldColor,
                                elevation: 5,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                confirmButtonStyle: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(
                                    AppColors.containerColor,
                                  ),
                                ),
                                inputDecorationTheme: InputDecorationTheme(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                headerHelpStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  wordSpacing: 1.5,
                                  fontFamily: "Poppins",
                                ),
                                rangePickerHeaderBackgroundColor:
                                    AppColors.containerColor.withOpacity(0.5),
                                todayBackgroundColor: MaterialStateProperty.all(
                                    AppColors.containerColor),
                                rangePickerHeaderForegroundColor:
                                    AppColors.whiteColor,
                                rangeSelectionBackgroundColor:
                                    AppColors.whiteColor,
                                headerBackgroundColor: AppColors.containerColor,
                                dayForegroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                rangePickerElevation:
                                    BorderSide.strokeAlignCenter,
                                yearForegroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                yearStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  wordSpacing: 1.5,
                                  fontFamily: "Poppins",
                                ),
                                headerForegroundColor: Colors.white,
                                headerHeadlineStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  wordSpacing: 1.5,
                                  fontFamily: "Poppins",
                                ),
                                weekdayStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  wordSpacing: 1.5,
                                  fontFamily: "Poppins",
                                ),
                                dividerColor: Colors.white,
                                yearOverlayColor:
                                    const MaterialStatePropertyAll(
                                  Colors.white,
                                ),
                                
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                    },
                    readOnly: true,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontSize: context.dynamicHeight(0.016),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
