import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  int index = 0;
  DateTime today = DateTime.now();
  bottomNaveBarChanged(int i) {
    index = i;
    emit(BottomNavBarChanged());
  }

  onDaySelected(DateTime day, DateTime focusDay) {
    today = day;
    emit(DayChangedState());
  }
}
