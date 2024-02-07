import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:z_flow1/features/home/presentation/ui%20cubits/cubit/bottom_nav_bar_cubit.dart';

import '../../../../core/colors/colorrs.dart';

class BottomNavBarItem extends StatelessWidget {
  final String value;
  final int index;
  final BuildContext ctx;
  const BottomNavBarItem(
      {super.key, required this.value, required this.index, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ctx.read<BottomNavBarCubit>().bottomNaveBarChanged(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 4.h,
            width: 375.w * 0.2,
            decoration: ShapeDecoration(
                color: ctx.read<BottomNavBarCubit>().index == index
                    ? Colorrs.kCyan
                    : Colors.transparent,
                shadows: [
                  BoxShadow(
                    color: ctx.read<BottomNavBarCubit>().index == index
                        ? const Color(0x5937D3FF)
                        : Colors.transparent,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
                shape: const RoundedRectangleBorder()),
          ),
          const Spacer(
            flex: 2,
          ),
          Stack(children: [
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: SvgPicture.asset(
                value,
                height:
                    ctx.read<BottomNavBarCubit>().index == index ? 40.r : 30.r,
                color: ctx.read<BottomNavBarCubit>().index == index
                    ? Colorrs.kCyan.withOpacity(0.2)
                    : Colors.transparent,
                fit: ctx.read<BottomNavBarCubit>().index == index
                    ? BoxFit.none
                    : BoxFit.scaleDown,
              ),
            ),
            SvgPicture.asset(
              value,
              height:
                  ctx.read<BottomNavBarCubit>().index == index ? 40.r : 30.r,
              color: ctx.read<BottomNavBarCubit>().index == index
                  ? Colorrs.kCyan
                  : Colors.grey[600],
              fit: ctx.read<BottomNavBarCubit>().index == index
                  ? BoxFit.none
                  : BoxFit.scaleDown,
            ),
          ]),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
