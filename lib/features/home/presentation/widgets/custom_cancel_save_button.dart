import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomCancelSaveButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function()? onTap;
  const CustomCancelSaveButton({
    super.key,
    required this.color,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 8.h),
        decoration: BoxDecoration(
          boxShadow: [Constants.shadow],
          color: color,
          borderRadius: BorderRadius.circular(31.r),
        ),
        child: Text(
          text,
          style: color == Colorrs.kCyan
              ? Styles.style32.copyWith(color: Colors.white)
              : Styles.style32,
        ),
      ),
    );
  }
}
