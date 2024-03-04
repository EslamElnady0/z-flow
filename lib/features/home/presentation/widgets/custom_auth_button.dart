import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomAuthAccountButton extends StatelessWidget {
  final String text;
  const CustomAuthAccountButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.w,
      height: 37.h,
      decoration: BoxDecoration(
          color: Colorrs.kBackground,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [Constants.shadow],
          border: Border.all(
            color: Colorrs.kGreyDark,
            width: 2,
          )),
      child: Text(text, style: Styles.style16Bold),
    );
  }
}
