import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 100,
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w),
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 9.h),
            decoration: BoxDecoration(
              boxShadow: [Constants.shadow],
              borderRadius: BorderRadius.circular(16.r),
              color: Colorrs.kCyan,
            ),
            child: Text(
              "إنجاز جديد",
              style: Styles.style16Bold.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          Text(
            "رائع",
            style: Styles.style16,
          ),
          Text(
            "لقد حصلت علي مكافأة",
            style: Styles.style16,
          ),
          SizedBox(
            height: 10.h,
          ),
          Lottie.asset("assets/images/trophy.json", height: 100.h),
          Text(
            "10+ نقاط",
            style: Styles.style16Bold.copyWith(color: Colorrs.kCyan),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colorrs.kCyan,
              ),
              child: Text(
                "إغلاق",
                style: Styles.style16Bold.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
