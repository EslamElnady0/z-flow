import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:z_flow1/core/colors/colorrs.dart';

AppBar buildCustomAppBar(
    {void Function()? onLeadingPressed, required IconData leading}) {
  return AppBar(
    backgroundColor: Colorrs.kWhite,
    actions: [
      IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/images/search.svg",
          height: 24.r,
        ),
      ),
    ],
    leading: IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(
          leading,
          size: 30.r,
        )),
    elevation: 2,
    shadowColor: Colors.black,
  );
}
