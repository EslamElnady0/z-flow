import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:z_flow1/features/tasks/presentation/widgets/custom_usage_button.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/title_text_widget.dart';

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
          child: const CustomUsageButton(
            text: "وقت الإستخدام",
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 56.w),
          child: const CustomUsageButton(
            text: 'حدود الإستخدام',
          ),
        ),
      ],
    );
  }
}
