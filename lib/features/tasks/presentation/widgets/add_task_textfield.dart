import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class AddTaskTextField extends StatelessWidget {
  final String hintText;
  final IconData suffixIcon;
  const AddTaskTextField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          boxShadow: [Constants.shadow]),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            focusedBorder: Constants.addTaskTextfieldBorder,
            border: Constants.addTaskTextfieldBorder,
            enabledBorder: Constants.addTaskTextfieldBorder,
            hintText: hintText,
            hintStyle: Styles.style16.copyWith(color: Colorrs.kGrey),
            suffixIcon: Icon(
              suffixIcon,
              size: 24.r,
              color: Colorrs.kGrey,
            )),
      ),
    );
  }
}
