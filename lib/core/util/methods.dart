import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';

import '../../features/drawer/data/cubits/get target cubit/get_target_cubit.dart';
import '../../features/drawer/data/models/target model/target_model.dart';
import '../../features/home/data/cubit/get habit cubit/get_habit_cubit.dart';
import '../../features/home/data/cubit/get task cubit/get_task_cubit.dart';
import '../../features/home/data/models/habits model/habit_model.dart';

class HelperMethods {
  static showSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static clearAllLists(BuildContext context) {
    Hive.box<TaskModel>(Constants.tasksBox).clear();
    Hive.box<HabitModel>(Constants.habitBox).clear();
    Hive.box<TargetModel>(Constants.targetBox).clear();
    context.read<GetTaskCubit>().completedTasksList.clear();
    context.read<GetTaskCubit>().runningTasksList.clear();
    context.read<GetTaskCubit>().specificDayTasksList.clear();
    context.read<GetHabitCubit>().runningHabitsList.clear();
    context.read<GetHabitCubit>().completedHabitsList.clear();
    context.read<GetTargetCubit>().targetsList.clear();
  }
}
