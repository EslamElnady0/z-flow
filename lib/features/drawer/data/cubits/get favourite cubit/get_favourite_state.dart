part of 'get_favourite_cubit.dart';

@immutable
sealed class GetFavouriteState {}

final class GetFavouriteInitial extends GetFavouriteState {}

final class GetFavouriteTasksSuccess extends GetFavouriteState {}

final class GetFavouriteHabitsSuccess extends GetFavouriteState {}
