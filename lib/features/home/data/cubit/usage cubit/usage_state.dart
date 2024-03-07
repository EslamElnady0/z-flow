part of 'usage_cubit.dart';

@immutable
sealed class UsageState {}

final class UsageInitial extends UsageState {}

final class UsageLoading extends UsageState {}

final class UsageSuccess extends UsageState {}

final class UsageFailure extends UsageState {}
