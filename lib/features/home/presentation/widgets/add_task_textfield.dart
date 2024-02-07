import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';

class AddTaskTextField extends StatelessWidget {
  final String hintText;
  final IconData suffixIcon;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  const AddTaskTextField({
    super.key,
    required this.hintText,
    required this.suffixIcon,
    this.controller,
    this.enabled,
    this.onChanged,
    this.keyboardType,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.style16,
      validator: validator ??
          (value) {
            if (value!.isEmpty) {
              return "هذا الحقل مطلوب";
            } else {
              return null;
            }
          },
      keyboardType: keyboardType,
      onChanged: onChanged,
      enabled: enabled ?? true,
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          hintText: hintText,
          hintStyle: Styles.style16.copyWith(color: Colorrs.kGrey),
          suffixIcon: Icon(
            suffixIcon,
            size: 24.r,
            color: Colorrs.kGrey,
          )),
    );
  }
}
