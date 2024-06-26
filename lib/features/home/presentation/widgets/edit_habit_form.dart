import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/services/local_notifications.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/core/util/increament_method.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/presentation/widgets/add_task_textfield.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_check_box_container.dart';
import 'package:z_flow1/features/home/presentation/widgets/show_animated_dialog.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

import '../../../../core/services/firebase_auth.dart';
import '../../../../core/services/firebase_firestore.dart';

class EditHabitForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final HabitModel habitModel;
  final TextEditingController habitController;
  final TextEditingController deadlineController;

  const EditHabitForm({
    super.key,
    required this.formKey,
    required this.habitController,
    required this.deadlineController,
    required this.habitModel,
  });

  @override
  State<EditHabitForm> createState() => _EditHabitFormState();
}

class _EditHabitFormState extends State<EditHabitForm> {
  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          TitleTextWidget(
            text: "تعديل عادة",
            style: Styles.style24,
          ),
          SizedBox(
            height: 32.h,
          ),
          AddTaskTextField(
            hintText: 'العادة',
            suffixIcon: FontAwesomeIcons.listCheck,
            controller: widget.habitController,
          ),
          SizedBox(
            height: 24.h,
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
            height: 24.h,
          ),
          BlocBuilder<GetHabitCubit, GetHabitState>(builder: (context, state) {
            return Column(
              children: [
                CustomCheckBoxContainer(
                  value: widget.habitModel.isIterable,
                  text: "تذكير بهذه العادة",
                  onChange: (value) {
                    widget.habitModel.isIterable =
                        !(widget.habitModel.isIterable);
                    context.read<GetHabitCubit>().getHabits();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomCheckBoxContainer(
                  value: widget.habitModel.isDone,
                  text: "اتمام العادة لليوم",
                  onChange: (value) {
                    widget.habitModel.isDone = !(widget.habitModel.isDone);
                    widget.habitModel.save();
                    if (widget.habitModel.isDone) {
                      context
                          .read<GetHabitCubit>()
                          .runningHabitsList
                          .remove(widget.habitModel);
                    } else {
                      context
                          .read<GetHabitCubit>()
                          .completedHabitsList
                          .remove(widget.habitModel);
                    }
                    context.read<GetHabitCubit>().getHabits();
                  },
                ),
              ],
            );
          }),
          SizedBox(
            height: 24.h,
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

                    widget.habitModel.title = widget.habitController.text;
                    widget.habitModel.deadline = widget.deadlineController.text;
                    widget.formKey.currentState!.save();
                    widget.habitModel.save();
                    context.read<GetHabitCubit>().getHabits();
                    // if (hasInternet) {
                    firestoreServices.editHabitInFirestore(
                        habitModel: widget.habitModel, uid: uid);
                    //   }
                    Navigator.pop(context);
                    if (!widget.habitModel.isDoneBefore &&
                        widget.habitModel.isDone) {
                      showAnimatedDialog(context);
                      incrementPoints();
                      widget.habitModel.isDoneBefore = true;
                    }

                    if (widget.habitModel.isIterable) {
                      LocalNotifications.showSchadualedNotification(
                          title: widget.habitModel.title,
                          body: "${widget.habitModel.title} تتصل بك ",
                          payload: "",
                          scheduledDate: LocalNotifications.scheduleDaily(),
                          id: widget.habitModel.id);
                    } else {
                      LocalNotifications.cancelNotification(
                          id: widget.habitModel.id);
                    }
                  } else {}
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
