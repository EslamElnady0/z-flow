import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  IconData? suffixIcon;
  final IconData prefixIcon;
  VoidCallback? onTap;
  final bool isPassword;
  final TextInputType? keyboardType;
  String? Function(String?)? validate;
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;

  CustomTextFormField({
    this.autoValidateMode,
    required this.keyboardType,
    this.validate,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    required this.isPassword,
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autoValidateMode,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      validator: widget.validate,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        suffixIcon: IconButton(
          onPressed: widget.onTap,
          icon: Icon(widget.suffixIcon),
          color: Colors.grey.shade400,
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey.shade400,
        ),
        border: Constants.textFieldBorder,
        focusedBorder: Constants.textFieldBorder,
        enabledBorder: Constants.textFieldBorder,
        errorBorder: Constants.textFieldBorder,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
    );
  }
}
