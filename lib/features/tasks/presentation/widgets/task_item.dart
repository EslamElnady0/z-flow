import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          Container(
            padding: EdgeInsets.only(right: 8.w),
            width: 291.w,
            height: 54.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF3C3C3C)),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [Constants.shadow],
            ),
            child: Center(
                child: Row(
              children: [
                Text('هذا مجرد نص تجريبي فقط', style: Styles.style16),
                const Spacer(),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert))
              ],
            )),
          )
        ],
      ),
    );
  }
}
