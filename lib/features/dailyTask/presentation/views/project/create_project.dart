import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_daily_task/config/constants/project_categories.dart';
import 'package:flutter_daily_task/config/extension/context_extension.dart';
import 'package:flutter_daily_task/config/items/app_colors.dart';
import 'package:flutter_daily_task/features/dailyTask/domain/entities/project.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/project/remote/project_bloc.dart';
import 'package:flutter_daily_task/features/dailyTask/presentation/bloc/project/remote/project_events.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../../../../config/utility/utils/utils.dart';
import '../../bloc/project/remote/project_state.dart';
import '../../widgets/input_field.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String>? assigness = [];

  @override
  void initState() {
    super.initState();
    dateController.text = DateFormat("dd MMM yy").format(DateTime.now());
    timeController.text = DateFormat("HH:mm").format(DateTime.now());
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    timeController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.blackColor,
          child: Column(
            children: [
              Padding(
                padding: context.paddingAllDefault,
                child: Container(
                  height: context.height * 0.71,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: context.dynamicHeight(0.03)),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Add Project",
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: AppColors.blackColor),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () {
                                BlocProvider.of<ProjectBloc>(context)
                                    .add(const FetchProjects());
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: context.paddingAllDefault,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _title(context, "Title"),
                                InputField(
                                  controller: titleController,
                                  hintText: "Enter Project Title",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Title cannot be empty";
                                    } else if (value.length < 3) {
                                      return "Title must be at least 3 characters";
                                    }
                                    return null;
                                  },
                                ),
                                _title(context, "Description"),
                                InputField(
                                  controller: descriptionController,
                                  hintText: "Enter project details",
                                  maxLines: 3,
                                ),
                                _title(context, "Category"),
                                BlocBuilder<ProjectBloc, ProjectState>(
                                  builder: (context, state) {
                                    return Padding(
                                      padding: context.paddingVerticalLow,
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            maxHeight:
                                                context.dynamicHeight(0.078),
                                            minHeight:
                                                context.dynamicHeight(0.05)),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: projectCategories.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final category =
                                                projectCategories[index];
                                            final selectedCategory =
                                                state.category;
                                            return GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<ProjectBloc>(
                                                        context)
                                                    .add(
                                                  ChooseCategory(
                                                      category: category.title),
                                                );
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  right: context
                                                      .dynamicWidth(0.05),
                                                  top: context
                                                      .dynamicHeight(0.01),
                                                ),
                                                child: AnimatedContainer(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: selectedCategory ==
                                                            category.title
                                                        ? category.color
                                                        : AppColors.whiteColor,
                                                    border: Border.all(
                                                      color: selectedCategory ==
                                                              category.title
                                                          ? category.color
                                                          : AppColors
                                                              .blackColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 400),
                                                  child: Padding(
                                                    padding: context
                                                        .paddingAllDefault,
                                                    child: Text(
                                                      category.title,
                                                      style: context
                                                          .textTheme.bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .blackColor),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _title(context, "Date"),
                                          InputField(
                                            controller: dateController,
                                            readOnly: true,
                                            showCursor: false,
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2000),
                                                lastDate: DateTime(2025),
                                              ).then(
                                                (value) {
                                                  if (value != null) {
                                                    dateController.text =
                                                        DateFormat("dd MMM yy")
                                                            .format(value);
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: context.dynamicWidth(0.05)),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _title(context, "Time"),
                                          InputField(
                                            controller: timeController,
                                            readOnly: true,
                                            showCursor: false,
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then(
                                                (value) {
                                                  if (value != null) {
                                                    timeController.text =
                                                        DateFormat("HH:mm")
                                                            .format(
                                                      DateTime(
                                                        2021,
                                                        1,
                                                        1,
                                                        value.hour,
                                                        value.minute,
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: context.paddingHorizontalHigh,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Assign To",
                        style: context.textTheme.labelLarge?.copyWith(
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    BlocBuilder<ProjectBloc, ProjectState>(
                      builder: (context, state) {
                        return Padding(
                          padding: context.paddingTopDefault,
                          child: Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    for (int i = 0;
                                        i <
                                            ((state.members ?? []).length > 4
                                                ? 4
                                                : (state.members ?? []).length);
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: i * context.dynamicWidth(0.1),
                                        ),
                                        child: GestureDetector(
                                          onLongPress: () {
                                            BlocProvider.of<ProjectBloc>(
                                                    context)
                                                .add(
                                              RemoveMemberEvent(
                                                member: state.members![i],
                                              ),
                                            );
                                          },
                                          child: CircleAvatar(
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            radius: 25,
                                            child: CircleAvatar(
                                                radius: 24,
                                                backgroundColor:
                                                    AppColors.titleTextColor,
                                                child: Text(
                                                  state.members?[i].email?[0]
                                                          .toUpperCase() ??
                                                      "M",
                                                  style: context
                                                      .textTheme.labelLarge
                                                      ?.copyWith(
                                                    color: AppColors.whiteColor,
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              // Add Member
                              InkWell(
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return Dialog(
                                            insetPadding: EdgeInsets.symmetric(
                                              horizontal:
                                                  context.dynamicWidth(0.05),
                                              vertical:
                                                  context.dynamicHeight(0.15),
                                            ),
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            alignment: Alignment.center,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding:
                                                  context.paddingAllDefault,
                                              child: Column(
                                                children: [
                                                  _title(context, "Add Member"),
                                                  Padding(
                                                    padding: context
                                                        .paddingVerticalDefault,
                                                    child: TextField(
                                                      controller:
                                                          emailController,
                                                      onChanged: (value) {
                                                        BlocProvider.of<
                                                                    ProjectBloc>(
                                                                context)
                                                            .add(
                                                          FetchMember(
                                                              email: value),
                                                        );
                                                      },
                                                      style: context
                                                          .textTheme.bodyMedium
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .whiteColor),
                                                      decoration:
                                                          InputDecoration(
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                          horizontal: context
                                                              .dynamicWidth(
                                                                  0.05),
                                                          vertical: context
                                                              .dynamicHeight(
                                                                  0.015),
                                                        ),
                                                        filled: true,
                                                        fillColor: AppColors
                                                            .blackColor,
                                                        hintText: "Email",
                                                        hintStyle: context
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.copyWith(
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                        suffixIcon: const Icon(
                                                          Icons.search_outlined,
                                                          color: AppColors
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: context
                                                        .paddingVerticalLow,
                                                    child: const Divider(),
                                                  ),
                                                  BlocBuilder<ProjectBloc,
                                                      ProjectState>(
                                                    builder: (context, state) {
                                                      return Expanded(
                                                        child: state
                                                                is MembersLoading
                                                            ? const CircularProgressIndicator
                                                                .adaptive()
                                                            : ListView.builder(
                                                                itemCount: state
                                                                        .fetchedMembers
                                                                        ?.length ??
                                                                    0,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  final member =
                                                                      state.fetchedMembers?[
                                                                          index];
                                                                  return BlocBuilder<
                                                                      ProjectBloc,
                                                                      ProjectState>(
                                                                    builder:
                                                                        (context,
                                                                            state) {
                                                                      return GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          BlocProvider.of<ProjectBloc>(context)
                                                                              .add(
                                                                            SelectMember(member: member!),
                                                                          );
                                                                        },
                                                                        child:
                                                                            AnimatedContainer(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: (state.selectedMembers ?? []).contains(member)
                                                                                ? AppColors.educationCatColor
                                                                                : AppColors.whiteColor,
                                                                            border:
                                                                                Border.all(
                                                                              color: (state.selectedMembers ?? []).contains(member) ? AppColors.educationCatColor : AppColors.blackColor,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(
                                                                              10,
                                                                            ),
                                                                          ),
                                                                          duration:
                                                                              const Duration(milliseconds: 400),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                context.paddingAllLow,
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                CircleAvatar(
                                                                                  backgroundColor: AppColors.whiteColor,
                                                                                  radius: 25,
                                                                                  child: CircleAvatar(
                                                                                      radius: 24,
                                                                                      backgroundColor: AppColors.titleTextColor,
                                                                                      child: Text(
                                                                                        member?.email?[0].toUpperCase() ?? "M",
                                                                                        style: context.textTheme.labelLarge?.copyWith(
                                                                                          color: AppColors.whiteColor,
                                                                                        ),
                                                                                      )),
                                                                                ),
                                                                                Padding(
                                                                                  padding: context.paddingHorizontalLow,
                                                                                  child: Text(
                                                                                    "${member?.email}",
                                                                                    style: context.textTheme.bodySmall?.copyWith(
                                                                                      color: AppColors.blackColor,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                      );
                                                    },
                                                  ),
                                                  BlocBuilder<ProjectBloc,
                                                      ProjectState>(
                                                    builder: (context, state) {
                                                      return Padding(
                                                        padding: context
                                                            .paddingVerticalDefault,
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            final selectedMembers =
                                                                state
                                                                    .selectedMembers;
                                                            BlocProvider.of<
                                                                        ProjectBloc>(
                                                                    context)
                                                                .add(
                                                              AddMember(
                                                                members:
                                                                    selectedMembers ??
                                                                        [],
                                                              ),
                                                            );
                                                          },
                                                          minWidth:
                                                              double.infinity,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                          ),
                                                          color: AppColors
                                                              .yellowColor,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: context
                                                                  .dynamicWidth(
                                                                      0.05),
                                                              vertical: context
                                                                  .dynamicHeight(
                                                                      0.015),
                                                            ),
                                                            child: Text(
                                                              "Add Member",
                                                              style: context
                                                                  .textTheme
                                                                  .labelMedium
                                                                  ?.copyWith(
                                                                color: AppColors
                                                                    .titleTextColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: AppColors.yellowColor,
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.blackColor,
                                    radius: 23,
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.yellowColor,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              BlocConsumer<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.08),
                      vertical: context.dynamicHeight(0.025),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          final formattedDate = DateFormat("dd MMM yyyy")
                              .parse(dateController.text);
                          final formattedTime =
                              DateFormat("HH:mm").parse(timeController.text);
                          final uid = const Uuid().v4();
                          final year = int.parse("20${formattedDate.year}");
                          DateTime deadline = DateTime(
                            year,
                            formattedDate.month,
                            formattedDate.day,
                            formattedTime.hour,
                            formattedTime.minute,
                          );
                          BlocProvider.of<ProjectBloc>(context).add(
                            CreateProjectEvent(
                              project: ProjectEntity(
                                uid: uid,
                                name: titleController.text,
                                description: descriptionController.text,
                                category: state.category,
                                assigness: state.members,
                                createdAt: DateTime.now(),
                                deadline: deadline,
                              ),
                            ),
                          );
                        }
                      },
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: AppColors.yellowColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.05),
                          vertical: context.dynamicHeight(0.015),
                        ),
                        child: state is ProjectCreating
                            ? const CircularProgressIndicator.adaptive()
                            : Text(
                                "Create Project",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(color: AppColors.titleTextColor),
                              ),
                      ),
                    ),
                  );
                },
                listener: (BuildContext context, ProjectState state) {
                  if (state is ProjectCreated) {
                    Utils.showSnackBar(
                      context: context,
                      title: "Success!",
                      message: "Project created successfully.",
                      contentType: ContentType.success,
                    );

                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Text _title(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.labelLarge?.copyWith(
        color: AppColors.titleTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
