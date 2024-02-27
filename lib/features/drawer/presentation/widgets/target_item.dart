import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/data/models/target%20model/target_model.dart';
import 'package:z_flow1/features/drawer/presentation/screens/target%20screen/edit_target_screen.dart';

class TargetItem extends StatelessWidget {
  final TargetModel targetModel;
  const TargetItem({super.key, required this.targetModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 58.h,
      decoration: BoxDecoration(
        boxShadow: [Constants.shadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250.w,
            child: Text(
              targetModel.title,
              style: Styles.style16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditTargetScreen(
                            targetModel: targetModel,
                          )));
            },
            child: Icon(
              FontAwesomeIcons.penToSquare,
              size: 20.r,
            ),
          )
        ],
      ),
    );
  }
}
