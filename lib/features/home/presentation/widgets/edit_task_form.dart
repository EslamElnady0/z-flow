import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/core/util/increament_method.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/widgets/add_task_textfield.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_check_box_container.dart';
import 'package:z_flow1/features/home/presentation/widgets/show_animated_dialog.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';
import '../../../../core/services/firebase_auth.dart';
import '../../../../core/services/firebase_firestore.dart';

class EditTaskForm extends StatefulWidget {
  final TaskModel taskModel;
  final GlobalKey<FormState> formKey;
  final TextEditingController taskController;
  final TextEditingController deadlineController;
  final TextEditingController notesController;
  final TextEditingController sideTaskController;
  const EditTaskForm({
    super.key,
    required this.formKey,
    required this.taskController,
    required this.deadlineController,
    required this.notesController,
    required this.sideTaskController,
    required this.taskModel,
  });

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  late StreamSubscription internetSubscription;
  bool hasInternet = false;
  @override
  void initState() {
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternetConnection =
          status == InternetConnectionStatus.connected;
      setState(() {
        hasInternet = hasInternetConnection;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    internetSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: "تعديل المهمة",
            style: Styles.style24,
          ),
          SizedBox(
            height: 24.h,
          ),
          AddTaskTextField(
            hintText: 'المهمة',
            suffixIcon: FontAwesomeIcons.listCheck,
            controller: widget.taskController,
          ),
          SizedBox(
            height: 16.h,
          ),
          AddTaskTextField(
            hintText: 'تنتهي في.',
            controller: widget.deadlineController,
            keyboardType: TextInputType.none,
            onTap: () {
              showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.utc(2026))
                  .then((value) {
                setState(() {
                  widget.deadlineController.text =
                      DateFormat.yMMMd().format(value!);
                });
              });
            },
            suffixIcon: FontAwesomeIcons.calendarCheck,
          ),
          SizedBox(
            height: 16.h,
          ),
          AddTaskTextField(
            hintText: 'ملاحظات',
            suffixIcon: FontAwesomeIcons.noteSticky,
            controller: widget.notesController,
          ),
          SizedBox(
            height: 16.h,
          ),
          AddTaskTextField(
            hintText: 'مهمة فرعية',
            suffixIcon: FontAwesomeIcons.hubspot,
            controller: widget.sideTaskController,
            validator: (value) {
              return null;
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              return CustomCheckBoxContainer(
                value: widget.taskModel.isDone,
                text: "إنهاء المهمة",
                onChange: (value) {
                  widget.taskModel.isDone = !(widget.taskModel.isDone);
                  widget.taskModel.save();
                  if (widget.taskModel.isDone) {
                    context
                        .read<GetTaskCubit>()
                        .runningTasksList
                        .remove(widget.taskModel);
                  } else {
                    context
                        .read<GetTaskCubit>()
                        .completedTasksList
                        .remove(widget.taskModel);
                  }
                  context.read<GetTaskCubit>().getTasks();
                },
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          const Spacer(
            flex: 3,
          ),
          Row(
            children: [
              CustomCancelSaveButton(
                color: Colors.white,
                text: 'حذف',
                onTap: () {
                  FirebaseFirestoreServices firestoreServices =
                      FirebaseFirestoreServices();
                  FireBaseAuthService fireBaseAuthService =
                      FireBaseAuthService();
                  String uid = fireBaseAuthService.auth.currentUser!.uid;
                  if (hasInternet) {
                    firestoreServices.deleteTaskFromFirestore(
                        taskModel: widget.taskModel, uid: uid);
                  }
                  widget.taskModel.delete();
                  context.read<GetTaskCubit>().getTasks();
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              CustomCancelSaveButton(
                color: Colorrs.kCyan,
                text: 'حفظ',
                onTap: () async {
                  if (widget.formKey.currentState!.validate()) {
                    FirebaseFirestoreServices firestoreServices =
                        FirebaseFirestoreServices();
                    FireBaseAuthService fireBaseAuthService =
                        FireBaseAuthService();
                    String uid = fireBaseAuthService.auth.currentUser!.uid;
                    widget.taskModel.title = widget.taskController.text;
                    widget.taskModel.deadline = widget.deadlineController.text;
                    widget.taskModel.notes = widget.notesController.text;
                    widget.taskModel.sideTask = widget.sideTaskController.text;
                    widget.formKey.currentState!.save();
                    widget.taskModel.save();
                    context.read<GetTaskCubit>().getTasks();
                    if (hasInternet) {
                      await firestoreServices.editTaskInFirestore(
                          taskModel: widget.taskModel, uid: uid);
                    }
                    if (context.mounted) {
                      Navigator.pop(context);
                      if (!widget.taskModel.isDoneBefore &&
                          widget.taskModel.isDone) {
                        showAnimatedDialog(context);
                        incrementPoints();
                        widget.taskModel.isDoneBefore = true;
                      }
                    }
                  }
                },
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
