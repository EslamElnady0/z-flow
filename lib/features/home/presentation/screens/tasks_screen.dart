import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/presentation/screens/add_task_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/task_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTaskCubit, GetTaskState>(
      builder: (context, state) {
        if (context.read<GetTaskCubit>().tasksList.isEmpty) {
          return Column(
            children: [
              SizedBox(
                height: 19.h,
              ),

              Icon(
                FontAwesomeIcons.fileCircleXmark,
                size: 60.r,
              ),
              Text(
                "no Tasks",
                style: Styles.style32,
              ),

              // const TitleTextWidget(
              //   text: 'مهام انتهت',
              // ),
              // SizedBox(
              //   height: 16.h,
              // ),
              // const TaskItem(),
              // const TaskItem(),
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
        } else {
          return Column(
            children: [
              SizedBox(
                height: 19.h,
              ),
              Text(
                "مهام مستمرة",
                style: Styles.style12,
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: context.read<GetTaskCubit>().tasksList.length,
                  itemBuilder: (context, index) {
                    return TaskItem(
                        taskModel:
                            context.read<GetTaskCubit>().tasksList[index]);
                  },
                ),
              ),
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
      },
    );
  }
}
