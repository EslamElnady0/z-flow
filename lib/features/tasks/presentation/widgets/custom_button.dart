import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 62.h,
        margin: EdgeInsets.symmetric(horizontal: 48.w, vertical: 14.h),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31.r),
          ),
          shadows: [Constants.shadow],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.add,
              size: 40.r,
              color: Colorrs.kCyan,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(text, style: Styles.style24)
          ],
        ),
      ),
    );
  }
}
