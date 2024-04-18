import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colorrs.dart';
import '../../../../core/constants/contstants.dart';
import '../../../../core/styles/styles.dart';

class GoogleRegistrationButton extends StatelessWidget {
  final VoidCallback onTap;
  const GoogleRegistrationButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
    );
  }
}
