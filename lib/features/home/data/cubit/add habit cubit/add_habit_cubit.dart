import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';

part 'add_habit_state.dart';

class AddHabitCubit extends Cubit<AddHabitState> {
  AddHabitCubit() : super(AddHabitInitial());

  addHabit(HabitModel habitModel) async {
    emit(AddHabitLoading());
    try {
      var habitBox = Hive.box<HabitModel>(Constants.habitBox);
      await habitBox.add(habitModel);
      emit(AddHabitSuccess());
    } catch (e) {
      emit(AddHabitFailure(errMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<AddHabitState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
