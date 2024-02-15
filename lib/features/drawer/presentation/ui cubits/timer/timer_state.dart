part of 'timer_cubit.dart';

@immutable
sealed class TimerState {}

final class TimerInitial extends TimerState {}

final class TimerChange extends TimerState {}

final class TimerIconChange extends TimerState {}
