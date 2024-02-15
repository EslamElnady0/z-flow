import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/features/drawer/presentation/ui%20cubits/work%20session/work_session_cubit.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/custom_work_container.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/cutom_play_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class WorkSessionInitialBody extends StatelessWidget {
  const WorkSessionInitialBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 34.h,
        ),
        const TitleTextWidget(
            text: "أنت علي وشك فتح جلسة عمل 25 دقيقة و5 دقايق استراحة"),
        SizedBox(
          height: 34.h,
        ),
        Container(
          decoration: BoxDecoration(
              boxShadow: [Constants.shadow],
              borderRadius: BorderRadius.circular(31.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(31.r),
            child: Image.asset(
              "assets/images/hourglass.gif",
              height: 166.h,
              width: 166.w,
            ),
          ),
        ),
        SizedBox(
          height: 46.h,
        ),
        Row(
          children: [
            const Spacer(),
            const CustomWorkContainer(
              text1: "5 min",
              text2: "Break",
            ),
            SizedBox(
              width: 10.w,
            ),
            Icon(
              Icons.add,
              color: Colorrs.kCyan,
              size: 40.r,
            ),
            SizedBox(
              width: 10.w,
            ),
            const CustomWorkContainer(
              text1: "25 min",
              text2: "Work",
            ),
            const Spacer()
          ],
        ),
        const Spacer(),
        CustomPlayButton(
          onTap: () {
            context.read<WorkSessionCubit>().startWorking();
          },
        ),
        const Spacer()
      ],
    );
  }
}
