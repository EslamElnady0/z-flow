import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/services/firebase_auth.dart';
import 'package:z_flow1/core/services/firebase_firestore.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/core/util/increament_method.dart';
import 'package:z_flow1/features/home/data/cubit/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/widgets/add_task_textfield.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class AddTaskForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController taskController;
  final TextEditingController deadlineController;
  final TextEditingController notesController;
  final TextEditingController sideTaskController;
  // bool hasInternet;
  // StreamSubscription internetSubscription;
  const AddTaskForm(
      {super.key,
      // required this.hasInternet,
      //  required this.internetSubscription,
      required this.formKey,
      required this.taskController,
      required this.deadlineController,
      required this.notesController,
      required this.sideTaskController});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  // @override
  // void initState() {
  //   widget.internetSubscription =
  //       InternetConnectionChecker().onStatusChange.listen((status) {
  //     final hasInternetConnection =
  //         status == InternetConnectionStatus.connected;
  //     setState(() {
  //       widget.hasInternet = hasInternetConnection;
  //     });
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   internetSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box(Constants.constsBox);
    int id = box.get("id") ?? 0;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: "إضافة مهمة جديدة",
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
                if (value == null) {
                  widget.deadlineController.text = '';
                } else {
                  setState(() {
                    widget.deadlineController.text =
                        DateFormat.yMMMd().format(value);
                  });
                }
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
              }),
          SizedBox(
            height: 16.h,
          ),
          const Spacer(
            flex: 4,
          ),
          Row(
            children: [
              CustomCancelSaveButton(
                color: Colors.white,
                text: 'الغاء',
                onTap: () => Navigator.pop(context),
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
                    widget.formKey.currentState!.save();
                    var taskModel = TaskModel(
                        id: id,
                        sideTask: widget.sideTaskController.text,
                        title: widget.taskController.text,
                        notes: widget.notesController.text,
                        createdAt: DateFormat.yMMMd().format(DateTime.now()),
                        deadline: widget.deadlineController.text);
                    context.read<AddTaskCubit>().addTask(taskModel);
                    context.read<GetTaskCubit>().getSpecificDayTasks(
                          DateTime.now(),
                        );
                    incrementNotificationId();
                    context.read<GetTaskCubit>().getTasks();
                    Navigator.pop(context);

                    // if (hasInternet) {
                    await firestoreServices.addTaskToFirestore(
                        taskModel: taskModel, uid: uid);
                    // }
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
