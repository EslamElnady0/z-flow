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
  int iteration;
  @HiveField(4)
  bool isFavourited = false;
  @HiveField(5)
  bool isIterable = false;
  @HiveField(6)
  bool isDone = false;
  @HiveField(7)
  bool isDoneBefore = false;
  @HiveField(8)
  int id = 0;

  HabitModel(
      {this.iteration = 3,
      this.title = '',
      this.createdAt = '',
      this.deadline = '',
      this.isFavourited = false,
      this.isIterable = false,
      this.isDone = false,
      this.isDoneBefore = false,
      this.id = 0});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'deadline': deadline,
      'createdAt': createdAt,
      'iteration': iteration,
      'isFavourited': isFavourited,
      'isIterable': isIterable,
      'isDone': isDone,
      'isDoneBefore': isDoneBefore,
      'id': id
    };
  }
}
