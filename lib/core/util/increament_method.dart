import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';

void incrementPoints() async {
  var box = Hive.box(Constants.constsBox);
  await box.put('score', (box.get('score') ?? 0) + 10);
}

void incrementNotificationId() async {
  var box = Hive.box(Constants.constsBox);
  await box.put("id", (box.get("id") ?? 0) + 1);
}
