import 'package:flutter/material.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/colors.dart';
import 'package:flutter_daily_task/config/theme/app_theme.dart';
import 'package:intl/intl.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _nameController.dispose();
    super.dispose();
  }

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
            height: context.dynamicHeight(0.35),
            decoration: BoxDecoration(
              color: AppColors.containerColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: context.paddingHorizontalDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.dynamicHeight(0.12),
                  ),
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
                    child: TextFormField(
                      controller: _nameController,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold,
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
                    child: TextFormField(
                      controller: _dateController,
                      onTap: () async {
                        await showDatePicker(
                          useRootNavigator: false,
                          barrierColor: AppColors.scaffoldColor,
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(20),
                          lastDate: DateTime(2025),
                          currentDate: DateTime.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: AppTheme.lightTheme,
                              child: child!,
                            );
                          },
                        ).then(
                          (value) {
                            if (value != null) {
                              _dateController.text =
                                  DateFormat("dd MMMM yyyy").format(value);
                            }
                          },
                        );
                      },
                      readOnly: true,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: context.dynamicHeight(0.02),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
