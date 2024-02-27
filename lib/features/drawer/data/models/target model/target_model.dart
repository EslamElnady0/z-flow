import 'package:hive/hive.dart';

part 'target_model.g.dart';

@HiveType(typeId: 3)
class TargetModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  final String createdAt;

  TargetModel({
    required this.title,
    required this.createdAt,
  });
}
