import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 62.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        margin: EdgeInsets.symmetric(horizontal: 48.w, vertical: 14.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31.r),
          ),
          shadows: [Constants.shadow],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(
              flex: 2,
            ),
            Icon(
              Icons.add,
              size: 40.r,
              color: Colorrs.kCyan,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(text, style: Styles.style24),
            const Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
