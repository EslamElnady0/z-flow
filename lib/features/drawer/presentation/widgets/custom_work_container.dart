import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomWorkContainer extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomWorkContainer({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 140.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [Constants.shadow],
          borderRadius: BorderRadius.circular(37.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textDirection: TextDirection.ltr,
            text1,
            style: Styles.style24.copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            text2,
            style: Styles.style24.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
