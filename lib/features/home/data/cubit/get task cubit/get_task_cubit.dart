import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';

part 'get_task_state.dart';

class GetTaskCubit extends Cubit<GetTaskState> {
  GetTaskCubit() : super(GetTaskInitial());

  List<TaskModel>? tasksList = [];

  getTasks() {
    var tasksBox = Hive.box<TaskModel>(Constants.tasksBox);

    tasksList = tasksBox.values.toList();
    emit(GetTaskSuccess());
  }
}
