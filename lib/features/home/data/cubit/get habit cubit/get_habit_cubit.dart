import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';

part 'get_habit_state.dart';

class GetHabitCubit extends Cubit<GetHabitState> {
  GetHabitCubit() : super(GetHabitInitial());

  List<HabitModel> habitList = [];

  getHabits() {
    var habitBox = Hive.box<HabitModel>(Constants.habitBox);
    habitList = habitBox.values.toList();
    emit(GetHabitSuccess());
  }
}
