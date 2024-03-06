import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomUsageButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CustomUsageButton({
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
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colorrs.kCyan,
            borderRadius: BorderRadius.circular(31.r),
            boxShadow: [Constants.shadow]),
        child: Center(
            child: Text(
          text,
          style: Styles.style24WhiteBold,
        )),
      ),
    );
  }
}
