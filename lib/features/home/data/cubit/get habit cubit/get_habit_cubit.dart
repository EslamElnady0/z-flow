import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';

part 'get_habit_state.dart';

class GetHabitCubit extends Cubit<GetHabitState> {
  GetHabitCubit() : super(GetHabitInitial());

  List<HabitModel> runningHabitsList = [];
  List<HabitModel> completedHabitsList = [];
  int iteration = 3;

  getHabits() {
    var habitBox = Hive.box<HabitModel>(Constants.habitBox);
    List<HabitModel> allHabits = habitBox.values.toList();
    for (var i = 0; i < allHabits.length; i++) {
      if (!allHabits[i].isDone) {
        if (!runningHabitsList.contains(allHabits[i])) {
          runningHabitsList.add(allHabits[i]);
        }
      } else {
        if (!completedHabitsList.contains(allHabits[i])) {
          completedHabitsList.add(allHabits[i]);
        }
      }
      runningHabitsList.sort(
        (a, b) {
          return a.createdAt.compareTo(b.createdAt);
        },
      );
      completedHabitsList.sort(
        (a, b) {
          return a.createdAt.compareTo(b.createdAt);
        },
      );
    }
    emit(GetHabitSuccess());
  }

  updateIterationContainer(int index, HabitModel habitModel) {
    switch (index) {
      case 0:
        habitModel.iteration = Iteration.dayly.value;
        iteration = habitModel.iteration;
      case 1:
        habitModel.iteration = Iteration.sixTimes.value;
        iteration = habitModel.iteration;

      case 2:
        habitModel.iteration = Iteration.fiveTimes.value;
        iteration = habitModel.iteration;

      case 3:
        habitModel.iteration = Iteration.fourTimes.value;
        iteration = habitModel.iteration;

      case 4:
        habitModel.iteration = Iteration.threeTimes.value;
        iteration = habitModel.iteration;

      default:
        habitModel.iteration = Iteration.zeroTimes.value;
        iteration = habitModel.iteration;
    }
    emit(UpdateIteration());
  }
}
