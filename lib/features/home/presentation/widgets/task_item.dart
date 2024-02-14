import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20favourite%20cubit/get_favourite_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/screens/edit_task_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_pop_up_menu_item.dart';

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
            checkColor: Colorrs.kCyan,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r)),
            side: MaterialStateBorderSide.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const BorderSide(color: Colorrs.kWhite);
              } else {
                return const BorderSide(color: Colorrs.kGreyDark);
              }
            }),
            fillColor: const MaterialStatePropertyAll(Colors.transparent),
            value: taskModel.isDone,
            onChanged: (value) {
              taskModel.isDone = !(taskModel.isDone);
              taskModel.save();
              if (taskModel.isDone) {
                context.read<GetTaskCubit>().runningTasksList.remove(taskModel);
              } else {
                context
                    .read<GetTaskCubit>()
                    .completedTasksList
                    .remove(taskModel);
              }
              context.read<GetTaskCubit>().getTasks();
            },
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
                        PopupMenuItem(
                            onTap: () {
                              taskModel.isFavourited = !taskModel.isFavourited;
                              taskModel.save();
                              context
                                  .read<GetFavouriteCubit>()
                                  .favouriteTasksList
                                  .remove(taskModel);
                              context
                                  .read<GetFavouriteCubit>()
                                  .getFavouriteTasks();
                            },
                            child: CustomPopUpMenuItem(
                              title: "المفضلة",
                              icon: taskModel.isFavourited
                                  ? FontAwesomeIcons.solidStar
                                  : FontAwesomeIcons.star,
                            )),
                        PopupMenuItem(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => EditTaskScreen(
                                        taskModel: taskModel,
                                      )));
                            },
                            child: const CustomPopUpMenuItem(
                                title: "تعديل",
                                icon: FontAwesomeIcons.penToSquare)),
                        PopupMenuItem(
                            onTap: () {
                              taskModel.delete();
                              context
                                  .read<GetFavouriteCubit>()
                                  .favouriteTasksList
                                  .remove(taskModel);

                              context
                                  .read<GetTaskCubit>()
                                  .completedTasksList
                                  .remove(taskModel);
                              context
                                  .read<GetTaskCubit>()
                                  .runningTasksList
                                  .remove(taskModel);
                              context.read<GetTaskCubit>().getTasks();
                              context
                                  .read<GetFavouriteCubit>()
                                  .getFavouriteTasks();
                            },
                            child: const CustomPopUpMenuItem(
                              title: "حذف",
                              icon: FontAwesomeIcons.trash,
                            )),
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
