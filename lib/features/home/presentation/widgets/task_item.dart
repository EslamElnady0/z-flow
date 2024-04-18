import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/core/util/increament_method.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20favourite%20cubit/get_favourite_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/screens/tasks%20screens/edit_task_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_pop_up_menu_item.dart';
import 'package:z_flow1/features/home/presentation/widgets/cutom_checkbox.dart';
import 'package:z_flow1/features/home/presentation/widgets/show_animated_dialog.dart';

import '../../../../core/services/firebase_auth.dart';
import '../../../../core/services/firebase_firestore.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItem({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              return CustomCheckBox(
                value: taskModel.isDone,
                onChanged: (value) async {
                  taskModel.isDone = !(taskModel.isDone);
                  if (taskModel.isDone) {
                    context
                        .read<GetTaskCubit>()
                        .runningTasksList
                        .remove(taskModel);
                    if (!taskModel.isDoneBefore) {
                      showAnimatedDialog(context);
                      incrementPoints();
                    }
                  } else {
                    context
                        .read<GetTaskCubit>()
                        .completedTasksList
                        .remove(taskModel);
                  }
                  taskModel.isDoneBefore = true;
                  taskModel.save();
                  context.read<GetTaskCubit>().getTasks();
                  FirebaseFirestoreServices firestoreServices =
                      FirebaseFirestoreServices();
                  FireBaseAuthService fireBaseAuthService =
                      FireBaseAuthService();
                  String uid = fireBaseAuthService.auth.currentUser!.uid;
                  // if (hasInternet) {
                  await firestoreServices.editTaskInFirestore(
                      taskModel: taskModel, uid: uid);
                  // }
                },
              );
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
                SizedBox(
                    width: 200.w,
                    child: Text(
                      taskModel.title,
                      style: Styles.style16,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )),
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
                            onTap: () async {
                              taskModel.isFavourited = !taskModel.isFavourited;
                              taskModel.save();
                              context
                                  .read<GetFavouriteCubit>()
                                  .favouriteTasksList
                                  .remove(taskModel);
                              context
                                  .read<GetFavouriteCubit>()
                                  .getFavouriteTasks();
                              FirebaseFirestoreServices firestoreServices =
                                  FirebaseFirestoreServices();
                              FireBaseAuthService fireBaseAuthService =
                                  FireBaseAuthService();
                              String uid =
                                  fireBaseAuthService.auth.currentUser!.uid;
                              //    if (hasInternet) {
                              await firestoreServices.editTaskInFirestore(
                                  taskModel: taskModel, uid: uid);
                              //  }
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
                            onTap: () async {
                              FirebaseFirestoreServices firestoreServices =
                                  FirebaseFirestoreServices();
                              FireBaseAuthService fireBaseAuthService =
                                  FireBaseAuthService();
                              String uid =
                                  fireBaseAuthService.auth.currentUser!.uid;
                              //   if (hasInternet) {
                              await firestoreServices.deleteTaskFromFirestore(
                                  taskModel: taskModel, uid: uid);
                              //   }
                              taskModel.delete();
                              if (context.mounted) {
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
                              }
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
