import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_tasks_stats_title.dart';

class CustomStatsItem extends StatelessWidget {
  final String title;
  final String complete;
  final String running;
  final List<dynamic> runningList;
  final List<dynamic> completedList;
  const CustomStatsItem({
    super.key,
    required this.title,
    required this.complete,
    required this.running,
    required this.runningList,
    required this.completedList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTasksStatsTitle(
          text: title,
        ),
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    complete,
                    style: Styles.style16,
                  ),
                  Text(
                    running,
                    style: Styles.style16,
                  )
                ],
              ),
              SizedBox(
                width: 24.w,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    completedList.length.toString(),
                    style: Styles.style16Bold.copyWith(color: Colorrs.kCyan),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    runningList.length.toString(),
                    style: Styles.style16Bold.copyWith(color: Colorrs.kCyan),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                  height: 89.h,
                  width: 89.w,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircularProgressIndicator(
                          color: Colorrs.kCyan,
                          strokeWidth: 7,
                          value: completedList.length /
                              (completedList.length + runningList.length)),
                      Center(
                          child: Text(
                        '${(completedList.length * 100 / (completedList.length + runningList.length)).round()}%',
                        style: Styles.style24WhiteBold
                            .copyWith(color: Colorrs.kCyan),
                      ))
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Divider(
          thickness: 1.5,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}
