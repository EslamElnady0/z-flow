import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        const TitleTextWidget(
          text: "انشاء عادات جديد اليوم",
        ),
        SizedBox(
          height: 8.h,
        ),
        SvgPicture.asset(
          "assets/images/habits_activities.svg",
          height: 128.h,
        ),
        SizedBox(
          height: 8.h,
        ),
        const Spacer(),
        const CustomButton(
          text: "إضافة عادة جديدة",
        )
      ],
    );
  }
}
