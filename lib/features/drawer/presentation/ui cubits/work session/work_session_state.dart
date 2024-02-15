part of 'work_session_cubit.dart';

@immutable
sealed class WorkSessionState {}

final class WorkSessionInitial extends WorkSessionState {}

final class WorkSessionWorking extends WorkSessionState {}

final class WorkSessionBreak extends WorkSessionState {}
