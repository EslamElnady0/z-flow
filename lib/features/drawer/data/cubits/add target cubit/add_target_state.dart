part of 'add_target_cubit.dart';

@immutable
sealed class AddTargetState {}

final class AddTargetInitial extends AddTargetState {}

final class AddTargetLoading extends AddTargetState {}

final class AddTargetSuccess extends AddTargetState {}

final class AddTargetFailure extends AddTargetState {
  final String errMessage;

  AddTargetFailure({required this.errMessage});
}
