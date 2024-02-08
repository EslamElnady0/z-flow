part of 'add_habit_cubit.dart';

@immutable
sealed class AddHabitState {}

final class AddHabitInitial extends AddHabitState {}

final class AddHabitLoading extends AddHabitState {}

final class AddHabitSuccess extends AddHabitState {}

final class AddHabitFailure extends AddHabitState {
  final String errMessage;

  AddHabitFailure({required this.errMessage});
}
