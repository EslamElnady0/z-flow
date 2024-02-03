import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/title_text_widget.dart';

class CustomTasksStatsTitle extends StatelessWidget {
  final String text;
  const CustomTasksStatsTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 163.w,
        ),
        TitleTextWidget(
          text: text,
          style: Styles.style16Bold,
        ),
        SizedBox(
          width: 129.w,
        ),
        Image.asset(
          "assets/images/settings-sliders.png",
          color: Colorrs.kGreyDark,
        ),
      ],
    );
  }
}
