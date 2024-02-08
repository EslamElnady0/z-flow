import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 2)
class HabitModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String deadline;
  @HiveField(2)
  final String createdAt;
  @HiveField(3)
  int iteration = 7;
  @HiveField(4)
  bool isFavourited = false;

  HabitModel({
    this.iteration = 7,
    required this.title,
    required this.createdAt,
    required this.deadline,
    this.isFavourited = false,
  });
}
