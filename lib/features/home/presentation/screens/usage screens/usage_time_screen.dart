import 'dart:async';
import 'dart:developer';
import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';

class UsageTimeScreen extends StatefulWidget {
  const UsageTimeScreen({super.key});

  @override
  State<UsageTimeScreen> createState() => _UsageTimeScreenState();
}

class _UsageTimeScreenState extends State<UsageTimeScreen> {
  List<AppUsageInfo> _infos = [];

  @override
  void initState() {
    super.initState();
    getInstalledUsedAppHelper();
  }

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
      DateTime startDate = endDate.subtract(const Duration(hours: 8));
      _infos = await AppUsage().getAppUsage(startDate, endDate);
      _infos.sort((a, b) => b.usage.inSeconds.compareTo(a.usage.inSeconds));
      packageNameList =
          List.generate(_infos.length, (index) => _infos[index].packageName);

      return packageNameList;
    } catch (exception) {
      log(exception.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildCustomAppBar(
          leading: Icons.arrow_back,
          onLeadingPressed: () => Navigator.pop(context),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              await getInstalledUsedAppHelper();
            },
            child: FutureBuilder(
                future: getInstalledUsedAppHelper(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colorrs.kBlacklight1,
                            child: ListTile(
                              leading: Container(
                                  width: 40.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.memory(
                                    snapshot.data![index].icon,
                                  )),
                              title: Text(
                                snapshot.data![index].appName,
                                style: Styles.style16
                                    .copyWith(color: Colors.white),
                              ),
                            ));
                        //  Text(
                        //     _infos[index].usage.inMinutes.toString(),
                        //     style:
                        //         Styles.style16.copyWith(color: Colors.white),
                        //   ),
                      },
                      itemCount: snapshot.data!.length,
                    );
                  } else if (snapshot.hasError) {
                    return const Text("Permissions!!");
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colorrs.kCyan,
                    ));
                  }
                })),
      ),
    );
  }
}
