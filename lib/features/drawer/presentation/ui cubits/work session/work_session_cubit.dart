import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'work_session_state.dart';

class WorkSessionCubit extends Cubit<WorkSessionState> {
  WorkSessionCubit() : super(WorkSessionInitial());

  startWorking() {
    emit(WorkSessionWorking());
  }

  startBreak() {
    emit(WorkSessionBreak());
  }

  backToInitial() {
    emit(WorkSessionInitial());
  }
}
