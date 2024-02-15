import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());
  Duration duration = const Duration();
  int workingSeconds = 60 * 25;
  int workingCounter = 60 * 25;
  int breakSeconds = 60 * 5;
  int breakCounter = 60 * 5;
  bool isPaused = false;

  updateTimer() {
    emit(TimerChange());
  }
}
