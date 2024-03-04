import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';

void incrementPoints() async {
  var box = Hive.box(Constants.pointsBox);
  await box.put('score', (box.get('score') ?? 0) + 10);
}
