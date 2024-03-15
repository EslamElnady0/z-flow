import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/services/local_notifications.dart';
import 'package:z_flow1/features/home/presentation/screens/usage%20screens/usage_time_screen.dart';

import 'package:z_flow1/features/home/presentation/widgets/custom_usage_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 57.w),
          child: const TitleTextWidget(
              text:
                  "يمكنك معرفة وقت استخدامك للتطبيقات ووضع حدود استخدام لكل تطبيق"),
        ),
        SizedBox(
          height: 42.h,
        ),
        Image.asset(
          "assets/images/24-hours.png",
          height: 186.h,
          width: 186.w,
        ),
        SizedBox(
          height: 64.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 56.w),
          child: CustomUsageButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const UsageTimeScreen()));
            },
            text: "وقت الإستخدام",
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 56.w),
          child: CustomUsageButton(
            onTap: () {
              // LocalNotifications.showSimpleNotification(
              //     title: "mrga",
              //     body: "he will never zebi mrga",
              //     payload: "mrga");
              // LocalNotifications.showPeriodicNotification(
              //     title: "dad", body: "ana mozah", payload: "sfsddfd");
            },
            text: 'حدود الإستخدام',
          ),
        ),
      ],
    );
  }
}
