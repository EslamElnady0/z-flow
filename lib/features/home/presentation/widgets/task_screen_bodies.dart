import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/screens/add_task_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/task_item.dart';

// ignore: must_be_immutable
class OnlyOneTaskListEmptyBody extends StatelessWidget {
  final String text;
  List<TaskModel> taskList;
  OnlyOneTaskListEmptyBody(
      {super.key, required this.text, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 19.h,
        ),
        Text(
          text,
          style: Styles.style12,
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return TaskItem(taskModel: taskList[index]);
            },
          ),
        ),
        CustomButton(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AddTaskScreen()));
          },
          text: "إضافة مهمة جديدة",
        )
      ],
    );
  }
}

class NoEmptyTaskListsBody extends StatefulWidget {
  final BuildContext context;
  const NoEmptyTaskListsBody({
    super.key,
    required this.context,
  });

  @override
  State<NoEmptyTaskListsBody> createState() => _NoEmptyTaskListsBodyState();
}

class _NoEmptyTaskListsBodyState extends State<NoEmptyTaskListsBody> {
  @override
  Widget build(BuildContext context) {
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
          flex: 2,
          child: ListView.builder(
            itemCount:
                widget.context.read<GetTaskCubit>().runningTasksList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                  taskModel: widget.context
                      .read<GetTaskCubit>()
                      .runningTasksList[index]);
            },
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "مهام مكتملة",
          style: Styles.style12,
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount:
                widget.context.read<GetTaskCubit>().completedTasksList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                  taskModel: widget.context
                      .read<GetTaskCubit>()
                      .completedTasksList[index]);
            },
          ),
        ),
        CustomButton(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AddTaskScreen()));
          },
          text: "إضافة مهمة جديدة",
        )
      ],
    );
  }
}
