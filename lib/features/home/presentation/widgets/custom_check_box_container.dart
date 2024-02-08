import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomCheckBoxContainer extends StatelessWidget {
  final String text;
  final void Function(bool?)? onChange;
  const CustomCheckBoxContainer({
    super.key,
    required this.text,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.w),
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [Constants.shadow],
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.style16,
          ),
          Checkbox(value: false, onChanged: onChange)
        ],
      ),
    );
  }
}
