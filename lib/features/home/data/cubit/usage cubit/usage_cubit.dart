import 'dart:developer';
import 'package:app_usage/app_usage.dart';
import 'package:bloc/bloc.dart';
import 'package:device_apps/device_apps.dart';
import 'package:meta/meta.dart';

part 'usage_state.dart';

class UsageCubit extends Cubit<UsageState> {
  UsageCubit() : super(UsageInitial());

  List<AppUsageInfo> infos = [];
  int totalUsageTime = 0;

  Future<List> getInstalledUsedApps(List<String>? packageNameList) async {
    var finalList = [];

    for (var appPackage in packageNameList!) {
      Application? app = await DeviceApps.getApp(appPackage, true);
      finalList.add(app);
    }
    return finalList;
  }

  Future<List<dynamic>>? getInstalledUsedAppHelper() async {
    List<String>? packageNameList = await getUsageStats();

    return await getInstalledUsedApps(packageNameList);
  }

  Future<List<String>?> getUsageStats() async {
    try {
      List<String> packageNameList = [];
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(days: 1));
      infos = await AppUsage().getAppUsage(startDate, endDate);

      infos.sort((a, b) => b.usage.inSeconds.compareTo(a.usage.inSeconds));

      packageNameList =
          List.generate(infos.length, (index) => infos[index].packageName);

      return packageNameList;
    } catch (exception) {
      log(exception.toString());
      return null;
    }
  }
}
