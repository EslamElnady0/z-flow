import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';

class CustomWhiteContainer extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const CustomWhiteContainer({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 9.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [Constants.shadow]),
      child: Center(
        child: Flexible(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: style ?? const TextStyle(fontFamily: "Cairo"),
          ),
        ),
      ),
    );
  }
}
