import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_auth_button.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_tasks_stats_title.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Image.asset(
          "assets/images/default_user.png",
          height: 88.h,
        ),
        SizedBox(
          height: 25.h,
        ),
        Row(
          children: [
            const Spacer(),
            const CustomAuthAccountButton(
              text: "Sign up",
            ),
            SizedBox(
              width: 19.w,
            ),
            const CustomAuthAccountButton(
              text: "Log in",
            ),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: 219.w,
          height: 37.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Colorrs.kCyan,
              boxShadow: [Constants.shadow]),
          child: Row(
            children: [
              const Spacer(
                flex: 5,
              ),
              Image.asset(
                "assets/images/google (2) 2.png",
                height: 24.h,
                width: 24.w,
              ),
              const Spacer(
                flex: 4,
              ),
              Text(
                "تسجيل الدخول بجوجل",
                style: Styles.style16Bold.copyWith(color: Colors.white),
              ),
              const Spacer(
                flex: 5,
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Divider(
          thickness: 1.5,
          color: Colors.grey.withOpacity(0.5),
        ),
        const CustomTasksStatsTitle(
          text: "المهام",
        ),
        SizedBox(
          height: 31.h,
        ),
        //////////////////////////////////////////
        //////////////////////////////////////////////
        /////////////////////////////////////////////
        SizedBox(
          height: 27.h,
        ),
        Divider(
          thickness: 1.5,
          color: Colors.grey.withOpacity(0.5),
        ),
        const CustomTasksStatsTitle(
          text: "العادات",
        ),
        SizedBox(
          height: 31.h,
        ),
        //////////////////////////////////////////
        //////////////////////////////////////////////
        /////////////////////////////////////////////
        SizedBox(
          height: 27.h,
        ),
        Divider(
          thickness: 1.5,
          color: Colors.grey.withOpacity(0.5),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Text(
                "عدد النقاط",
                style: Styles.style16Bold,
              ),
              const Spacer(),
              Text(
                "925",
                style: Styles.style16Bold.copyWith(color: Colorrs.kCyan),
              ),
            ],
          ),
        )
      ],
    );
  }
}
