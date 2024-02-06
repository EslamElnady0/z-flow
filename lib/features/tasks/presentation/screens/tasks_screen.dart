import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/features/tasks/presentation/screens/add_task_screen.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/task_item.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/title_text_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          child: Column(
            children: [
              SizedBox(
                height: 19.h,
              ),
              const TitleTextWidget(
                text: 'مهام مستمرة',
              ),
              SizedBox(
                height: 16.h,
              ),
              const TaskItem(),
              const TaskItem(),
              const TaskItem(),
            ],
          ),
        ),
        const TitleTextWidget(
          text: 'مهام انتهت',
        ),
        SizedBox(
          height: 16.h,
        ),
        const TaskItem(),
        const TaskItem(),
        const Spacer(),
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
