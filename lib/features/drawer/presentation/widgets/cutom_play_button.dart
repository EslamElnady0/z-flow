import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomPlayButton extends StatelessWidget {
  final void Function() onTap;
  const CustomPlayButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
        decoration: BoxDecoration(
            boxShadow: [Constants.shadow],
            borderRadius: BorderRadius.circular(27.r),
            color: Colors.white),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow,
              color: Colorrs.kCyan,
              size: 35.r,
            ),
            Text(
              "ابدأ الأن!",
              style: Styles.style24,
            )
          ],
        ),
      ),
    );
  }
}
