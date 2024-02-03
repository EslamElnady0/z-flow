import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/task_item.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/title_text_widget.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: 'تقويم ميلادي!',
            style: Styles.style10,
          ),
          SizedBox(
            height: 30.h,
          ),
          SvgPicture.asset(
            "assets/images/undraw_schedule_meeting_52nu 1.svg",
            width: 262.w,
            height: 191.h,
          ),
          Container(
            height: 234.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 30.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [Constants.shadow]),
          ),
          SizedBox(
            height: 24.h,
          ),
          TitleTextWidget(
            text: "مهامك في ذلك اليوم",
            style: Styles.style10,
          ),
          SizedBox(
            height: 24.h,
          ),
          TaskItem()
        ],
      ),
    );
  }
}
