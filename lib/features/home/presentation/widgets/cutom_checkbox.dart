import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const CustomCheckBox({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colorrs.kCyan,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      side: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return const BorderSide(color: Colorrs.kWhite);
        } else {
          return const BorderSide(color: Colorrs.kGreyDark);
        }
      }),
      fillColor: const MaterialStatePropertyAll(Colors.transparent),
      value: value,
      onChanged: onChanged,
    );
  }
}
