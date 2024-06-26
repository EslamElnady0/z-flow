import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:z_flow1/core/util/context_helpers.dart';

class CustomAuthButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final VoidCallback onTap;
  const CustomAuthButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? context.width * 0.4533333333333333,
        height: height ?? context.height * 0.0665024630541872,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(16.r)),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 23.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
