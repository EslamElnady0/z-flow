part of 'get_habit_cubit.dart';

@immutable
sealed class GetHabitState {}

final class GetHabitInitial extends GetHabitState {}

final class GetHabitSuccess extends GetHabitState {}
