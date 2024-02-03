import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/bottom_nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BuildContext ctx;
  const CustomBottomNavBar({
    super.key,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x3F000000),
            blurRadius: 4.r,
            offset: const Offset(0, -3),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...Constants.bottomNavBarItems.asMap().entries.map((entry) {
            int index = entry.key;
            String value = entry.value;
            return BottomNavBarItem(
              value: value,
              index: index,
              ctx: ctx,
            );
          })
        ],
      ),
    );
  }
}
