import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';

class CustomPopUpMenuItem extends StatelessWidget {
  const CustomPopUpMenuItem({
    super.key,
    required this.taskModel,
    required this.title,
    required this.icon,
  });

  final TaskModel taskModel;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<GetTaskCubit, GetTaskState>(
          builder: (context, state) {
            return Icon(
              icon,
              color: Colorrs.kGreyDark,
              size: 20.r,
            );
          },
        ),
        SizedBox(
          width: 10.w,
        ),
        const Spacer(),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: Styles.style16,
        )
      ],
    );
  }
}
