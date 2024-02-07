import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String notes;
  @HiveField(2)
  final String createdAt;
  @HiveField(3)
  String deadline;
  @HiveField(4)
  String sideTask;

  TaskModel({
    required this.sideTask,
    required this.title,
    required this.notes,
    required this.createdAt,
    required this.deadline,
  });
}
