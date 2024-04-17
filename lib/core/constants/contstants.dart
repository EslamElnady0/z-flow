import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:z_flow1/features/drawer/presentation/screens/advices_screen.dart';
// import 'package:z_flow1/features/drawer/presentation/screens/entertainment_screen.dart';
import 'package:z_flow1/features/drawer/presentation/screens/favourite_habits_screen.dart';
import 'package:z_flow1/features/drawer/presentation/screens/favourite_tasks_screen.dart';
// import 'package:z_flow1/features/drawer/presentation/screens/motivation_screen.dart';
import 'package:z_flow1/features/drawer/presentation/screens/target%20screen/target_screen.dart';
import 'package:z_flow1/features/drawer/presentation/screens/work_session_screen.dart';

class Constants {
  static const String tasksBox = "tasks-box";
  static const String habitBox = "habit-box";
  static const String targetBox = "target-box";
  static const String constsBox = "consts-box";
  static List<String> bottomNavBarItems = [
    "assets/images/tasks.svg",
    "assets/images/date.svg",
    "assets/images/usage.svg",
    "assets/images/happits.svg",
    "assets/images/account.svg",
  ];

  static List<String> popUpMenuItems = [
    "يوميا",
    "6 ايام في الأسبوع",
    "5 ايام في الأسبوع",
    "4 ايام في الأسبوع",
    "3 ايام في الأسبوع",
  ];

  static List<Map<String, dynamic>> drawerItems = [
    {
      "title": "فتح جلسة عمل",
      "icon": FontAwesomeIcons.clock, //1
    },
    {
      "title": "مهام مفضلة",
      "icon": FontAwesomeIcons.star, //2
    },
    {
      "title": "عادات مفضلة",
      "icon": FontAwesomeIcons.star, //3
    },
    // {"title": "المنافسة", "icon": FontAwesomeIcons.userGroup},
    // {
    //   "title": "تصنيفات",
    //   "icon": FontAwesomeIcons.rankingStar,
    // },
    // {
    //   "title": "نصائح",
    //   "icon": FontAwesomeIcons.scroll,
    // },
    // {
    //   "title": "تحفيز",
    //   "icon": FontAwesomeIcons.handFist,
    // },
    // {"title": "اقتراحات للترفيه", "icon": FontAwesomeIcons.masksTheater}, /
    {
      "title": "أهدافي",
      "icon": FontAwesomeIcons.crosshairs, //4
    },
    // {
    //   "title": "إضافة أداة",
    //   "icon": FontAwesomeIcons.squarePlus, //
    // },
    //{"title": "دعم", "icon": FontAwesomeIcons.handHoldingHeart}, //11
    {"title": "الإعدادات", "icon": FontAwesomeIcons.gear}, //5
    {
      "title": "مشاركة التطبيق",
      "icon": FontAwesomeIcons.shareNodes, //6
    },
  ];
  static const List<Widget> drawerScreens = [
    WorkSessionScreen(), //1
    FavouriteTasksScreen(), //2
    FavouriteHabitsScrenn(), //3
    // Scaffold(),
    // Scaffold(),
    // AdvicesScreen(),
    // MotivationScreen(),
    // EntertainmentScreen(),
    TargetScreen(), //4
    //  Scaffold(), //10
    Scaffold(), //5
    Scaffold(), //6
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

  static OutlineInputBorder addTaskTextfieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.circular(8.r),
  );
}

enum Iteration {
  dayly("يوميا", 7),
  sixTimes("6 ايام في الأسبوع", 6),
  fiveTimes("5 ايام في الأسبوع", 5),
  fourTimes("4 ايام في الأسبوع", 4),
  threeTimes("3 ايام في الأسبوع", 3),
  zeroTimes("أيام العادة", 0);

  final String name;
  final int value;
  const Iteration(this.name, this.value);
}
