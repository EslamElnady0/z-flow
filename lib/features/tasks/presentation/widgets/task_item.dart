import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/screens/edit_task_screen.dart';

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
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [Constants.shadow],
            ),
            child: Center(
                child: Row(
              children: [
                Text('هذا مجرد نص تجريبي فقط', style: Styles.style16),
                const Spacer(),
                PopupMenuButton(
                    splashRadius: 0.1,
                    offset: Offset(10.w, 10.h),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r)),
                    elevation: 5,
                    itemBuilder: (context) {
                      return [
                        ...Constants.popUpMenuItems.asMap().entries.map((e) {
                          var index = e.key;
                          var value = e.value;
                          return PopupMenuItem(
                              onTap: () {
                                if (index == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => EditTaskScreen()));
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    value["icon"],
                                    color: Colorrs.kGreyDark,
                                    size: 20.r,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    value["title"],
                                    style: Styles.style16,
                                  )
                                ],
                              ));
                        })
                      ];
                    })
              ],
            )),
          )
        ],
      ),
    );
  }
}
