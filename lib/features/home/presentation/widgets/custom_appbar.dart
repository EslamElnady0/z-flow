import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';

AppBar buildCustomAppBar(
    {void Function()? onLeadingPressed,
    required IconData leading,
    List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colorrs.kWhite,
    actions: actions,
    leading: IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(
          leading,
          size: 30.r,
          color: Colors.black,
        )),
    elevation: 2,
    shadowColor: Colors.black,
  );
}
