import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';

part 'get_favourite_state.dart';

class GetFavouriteCubit extends Cubit<GetFavouriteState> {
  GetFavouriteCubit() : super(GetFavouriteInitial());

  List<TaskModel> favouriteTasksList = [];
  List<HabitModel> favouriteHabitsList = [];

  getFavouriteTasks() {
    List<TaskModel> tasksList;
    var tasksBox = Hive.box<TaskModel>(Constants.tasksBox);
    tasksList = tasksBox.values.toList();
    for (var i = 0; i < tasksList.length; i++) {
      if (tasksList[i].isFavourited) {
        if (!favouriteTasksList.contains(tasksList[i])) {
          favouriteTasksList.add(tasksList[i]);
        }
      }
    }
    favouriteTasksList.sort(
      (a, b) {
        return a.createdAt.compareTo(b.createdAt);
      },
    );
    emit(GetFavouriteTasksSuccess());
  }

  getFavouriteHabits() {
    List<HabitModel> habitList;
    var habitBox = Hive.box<HabitModel>(Constants.habitBox);
    habitList = habitBox.values.toList();
    for (var i = 0; i < habitList.length; i++) {
      if (habitList[i].isFavourited) {
        if (!favouriteHabitsList.contains(habitList[i])) {
          favouriteHabitsList.add(habitList[i]);
        }
      }
    }
    favouriteHabitsList.sort(
      (a, b) {
        return a.createdAt.compareTo(b.createdAt);
      },
    );
    emit(GetFavouriteHabitsSuccess());
  }
}
