part of 'get_target_cubit.dart';

@immutable
sealed class GetTargetState {}

final class GetTargetInitial extends GetTargetState {}

final class GetTargetSuccess extends GetTargetState {}
