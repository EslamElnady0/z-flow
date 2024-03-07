import 'package:app_usage/app_usage.dart';
import 'package:flutter/material.dart';
import 'package:z_flow1/core/styles/styles.dart';

class UsageListTileTitle extends StatelessWidget {
  const UsageListTileTitle(
      {super.key,
      required List<AppUsageInfo> infos,
      required this.snapshot,
      required this.index})
      : _infos = infos;

  final List<AppUsageInfo> _infos;
  final int index;
  final AsyncSnapshot<List<dynamic>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          snapshot.data![index].appName,
          style: Styles.style16.copyWith(color: Colors.white),
        ),
        const Spacer(),
        Text(
          "${_infos[index].usage.inHours} ",
          style: Styles.style10
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "ساعة ",
          style: Styles.style10
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "${_infos[index].usage.inMinutes.remainder(60).toString().padLeft(2, '0')} ",
          style: Styles.style10
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        Text(
          "دقيقة",
          style: Styles.style10
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
