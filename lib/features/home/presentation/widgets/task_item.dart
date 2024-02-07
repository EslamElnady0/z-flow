import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/screens/edit_task_screen.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItem({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          Container(
            padding: EdgeInsets.only(right: 8.w),
            width: 291.w,
            height: 54.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [Constants.shadow],
            ),
            child: Center(
                child: Row(
              children: [
                Text(taskModel.title, style: Styles.style16),
                const Spacer(),
                PopupMenuButton(
                    splashRadius: 0.1,
                    offset: Offset(10.w, 10.h),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                    elevation: 5,
                    itemBuilder: (context) {
                      return [
                        ...Constants.popUpMenuItems.asMap().entries.map((e) {
                          var index = e.key;
                          var value = e.value;
                          return PopupMenuItem(
                              onTap: () {
                                if (index == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => EditTaskScreen(
                                            taskModel: taskModel,
                                          )));
                                }
                                if (index == 2) {
                                  taskModel.delete();
                                  context.read<GetTaskCubit>().getTasks();
                                } else {}
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    value["icon"],
                                    color: Colorrs.kGreyDark,
                                    size: 20.r,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    value["title"],
                                    style: Styles.style16,
                                  )
                                ],
                              ));
                        })
                      ];
                    })
              ],
            )),
          )
        ],
      ),
    );
  }
}
