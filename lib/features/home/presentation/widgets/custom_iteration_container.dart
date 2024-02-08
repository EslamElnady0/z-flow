import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';

class CustomIterationContainer extends StatelessWidget {
  final String text;
  const CustomIterationContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.w),
      height: 55.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [Constants.shadow],
          borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.style16,
          ),
          Row(
            children: [
              PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r)),
                  icon: const Icon(Icons.arrow_forward_ios),
                  itemBuilder: (context) {
                    return [
                      ...Constants.popUpMenuItems.asMap().entries.map((e) {
                        //var index = e.key;
                        var value = e.value;
                        return PopupMenuItem(
                            child: Center(
                          child: Column(
                            children: [
                              Text(
                                value,
                                style: Styles.style16,
                              ),
                            ],
                          ),
                        ));
                      })
                    ];
                  })
            ],
          )
        ],
      ),
    );
  }
}
