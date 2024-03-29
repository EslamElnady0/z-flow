import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());
  DateTime today = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<TaskModel> specificDayTasksList = [];
  List<TaskModel> runningTasksList = [];
  List<TaskModel> completedTasksList = [];

  getTasks() {
    var tasksBox = Hive.box<TaskModel>(Constants.tasksBox);
    List<TaskModel> allTasks = tasksBox.values.toList();
    for (var i = 0; i < allTasks.length; i++) {
      if (!allTasks[i].isDone) {
        if (!runningTasksList.contains(allTasks[i])) {
          runningTasksList.add(allTasks[i]);
        }
      } else {
        if (!completedTasksList.contains(allTasks[i])) {
          completedTasksList.add(allTasks[i]);
        }
      }
      runningTasksList.sort(
        (a, b) {
          return a.createdAt.compareTo(b.createdAt);
        },
      );
      completedTasksList.sort(
        (a, b) {
          return a.createdAt.compareTo(b.createdAt);
        },
      );
    }
    emit(GetTaskSuccess());
  }

  getSpecificDayTasks(
    DateTime day,
  ) {
    var tasksBox = Hive.box<TaskModel>(Constants.tasksBox);
    List<TaskModel> allTasks = tasksBox.values.toList();
    for (var task in allTasks) {
      if (task.createdAt == DateFormat.yMMMd().format(day)) {
        if (!specificDayTasksList.contains(task)) {
          specificDayTasksList.add(task);
        }
      }
    }
    emit(GetTaskSuccess());
    //  return list;
  }

  onDaySelected(DateTime day, DateTime focusDay) {
    today = day;
    // focusedDay = focusDay;
    specificDayTasksList = [];
    getSpecificDayTasks(focusDay);
    emit(DayChangedState());
  }
}
