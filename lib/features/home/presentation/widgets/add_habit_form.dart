import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/services/local_notifications.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/core/util/increament_method.dart';
import 'package:z_flow1/features/home/data/cubit/add%20habit%20cubit/add_habit_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/presentation/widgets/add_task_textfield.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_check_box_container.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_iteration_container.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class AddHabitForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController habitController;
  final TextEditingController deadlineController;

  const AddHabitForm({
    super.key,
    required this.formKey,
    required this.habitController,
    required this.deadlineController,
  });

  @override
  State<AddHabitForm> createState() => _AddHabitFormState();
}

@pragma('vm:entry-point')
callback(int id) async {
  await LocalNotifications.showSimpleNotification(
      title: "habit test", body: "test ya 7mada", payload: "dadasdas", id: id);
}

class _AddHabitFormState extends State<AddHabitForm> {
  bool isIterable = false;
  late HabitModel habitModel;
  @override
  void initState() {
    habitModel = HabitModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box(Constants.constsBox);
    int id = box.get("id") ?? 0;
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 32.h,
          ),
          TitleTextWidget(
            text: "إضافة عادة جديدة",
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
                CustomIterationContainer(
                  habitModel: habitModel,
                ),
                SizedBox(
                  height: 24.h,
                ),
                CustomCheckBoxContainer(
                  value: isIterable,
                  text: "تذكير بهذه العادة",
                  onChange: (value) {
                    isIterable = !isIterable;
                    setState(() {});
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
                onTap: () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.formKey.currentState!.save();
                    habitModel = HabitModel(
                        id: id,
                        title: widget.habitController.text,
                        isIterable: isIterable,
                        createdAt: DateFormat.yMMMd().format(
                          DateTime.now(),
                        ),
                        iteration: context.read<GetHabitCubit>().iteration,
                        deadline: widget.deadlineController.text);
                    context.read<AddHabitCubit>().addHabit(habitModel);
                    incrementNotificationId();
                    if (habitModel.isIterable) {}
                    context.read<GetHabitCubit>().getHabits();
                    Navigator.pop(context);
                    log(id.toString());
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
