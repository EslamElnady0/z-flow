import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  static List<String> bottomNavBarItems = [
    "assets/images/tasks.svg",
    "assets/images/date.svg",
    "assets/images/usage.svg",
    "assets/images/happits.svg",
    "assets/images/account.svg",
  ];
  static List<Map<String, dynamic>> drawerItems = [
    {
      "title": "فتح جلسة عمل",
      "icon": FontAwesomeIcons.clock,
    },
    {
      "title": "مهام مفضلة",
      "icon": FontAwesomeIcons.star,
    },
    {
      "title": "عادات مفضلة",
      "icon": FontAwesomeIcons.star,
    },
    {"title": "المنافسة", "icon": FontAwesomeIcons.userGroup},
    {
      "title": "تصنيفات",
      "icon": FontAwesomeIcons.rankingStar,
    },
    {
      "title": "نصائح",
      "icon": FontAwesomeIcons.scroll,
    },
    {
      "title": "تحفيز",
      "icon": FontAwesomeIcons.handFist,
    },
    {"title": "اقتراحات للترفيه", "icon": FontAwesomeIcons.masksTheater},
    {
      "title": "أهدافي",
      "icon": FontAwesomeIcons.crosshairs,
    },
    {
      "title": "إضافة أداة",
      "icon": FontAwesomeIcons.squarePlus,
    },
    {"title": "دعم", "icon": FontAwesomeIcons.handHoldingHeart},
    {"title": "الإعدادات", "icon": FontAwesomeIcons.gear},
    {
      "title": "مشاركة التطبيق",
      "icon": FontAwesomeIcons.shareNodes,
    },
  ];

  static BoxShadow shadow = const BoxShadow(
    color: Color(0x26000000),
    blurRadius: 4,
    offset: Offset(0, 4),
    spreadRadius: 0,
  );

  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: const BorderSide(color: Colors.white, width: 2));

  static LinearGradient zFlowGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blue,
        Colors.cyan,
        Color(0xff008971),
        Color(0xff006456),
        Color(0xff011720),
      ],
      stops: [
        0.05,
        0.2,
        0.6,
        0.8,
        1
      ]);
}
