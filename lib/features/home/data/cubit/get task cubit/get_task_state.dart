part of 'get_task_cubit.dart';

@immutable
sealed class GetTaskState {}

final class GetTaskInitial extends GetTaskState {}

final class GetTaskSuccess extends GetTaskState {}

final class DayChangedState extends GetTaskState {}
