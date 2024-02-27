import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTargetTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const AddTargetTextField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: 5,
      minLines: 1,
      decoration: InputDecoration(
          filled: true,
          hintText: "ادخل هدفك",
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h)),
    );
  }
}
