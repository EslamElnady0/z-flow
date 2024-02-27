import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/constants/decorated_input_border.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      fontFamily: "Cairo",
      inputDecorationTheme: InputDecorationTheme(
          border: DecoratedInputBorder(
              child: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide.none),
              shadow: Constants.shadow)),
      popupMenuTheme: const PopupMenuThemeData(
          color: Colors.white, surfaceTintColor: Colors.white),
      scaffoldBackgroundColor: Colorrs.kBackground);
}
