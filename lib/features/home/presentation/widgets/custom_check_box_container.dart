import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/presentation/widgets/cutom_checkbox.dart';

// ignore: must_be_immutable
class CustomCheckBoxContainer extends StatelessWidget {
  final String text;
  final void Function(bool?)? onChange;
  final bool value;
  const CustomCheckBoxContainer({
    super.key,
    required this.text,
    this.onChange,
    required this.value,
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
          CustomCheckBox(
            selectedBorderColor: Colorrs.kGreyDark,
            value: value,
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}
