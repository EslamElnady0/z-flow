import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/presentation/screens/tasks%20screens/add_task_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/task_screen_bodies.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        if (context.read<GetTaskCubit>().runningTasksList.isEmpty &&
            context.read<GetTaskCubit>().completedTasksList.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 19.h,
              ),
              Icon(
                FontAwesomeIcons.fileCircleXmark,
                size: 80.r,
              ),
              Text(
                "no Tasks",
                style: Styles.style32,
              ),
              const Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AddTaskScreen()));
                },
                text: "إضافة مهمة جديدة",
              )
            ],
          );
        }
        ////////////////////////////////////////
        else if (context.read<GetTaskCubit>().runningTasksList.isNotEmpty &&
            context.read<GetTaskCubit>().completedTasksList.isEmpty) {
          return OnlyOneTaskListEmptyBody(
              text: "مهام مستمرة",
              taskList: context.read<GetTaskCubit>().runningTasksList);
        }
        //////////////////////////////////////
        else if (context.read<GetTaskCubit>().runningTasksList.isEmpty &&
            context.read<GetTaskCubit>().completedTasksList.isNotEmpty) {
          return OnlyOneTaskListEmptyBody(
            text: "مهام مكتملة",
            taskList: context.read<GetTaskCubit>().completedTasksList,
          );
        }
        ///////////////////////////////////////////////
        else {
          return NoEmptyTaskListsBody(
            context: context,
          );
        }
      },
    );
  }
}
