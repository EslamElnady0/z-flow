import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_stats_item.dart';
import 'package:z_flow1/features/home/presentation/widgets/profile_header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeader(),
          SizedBox(
            height: 16.h,
          ),
          Divider(
            thickness: 1.5,
            color: Colors.grey.withOpacity(0.5),
          ),
          CustomStatsItem(
            title: 'المهام',
            complete: 'المهام المكتملة',
            running: 'المهام العالقة',
            completedList: context.read<GetTaskCubit>().completedTasksList,
            runningList: context.read<GetTaskCubit>().runningTasksList,
          ),
          CustomStatsItem(
              title: "العادات",
              complete: "العادات المكتملة",
              running: "العادات العالقة",
              runningList: context.read<GetHabitCubit>().habitList,
              completedList: context.read<GetHabitCubit>().habitList),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "عدد النقاط",
                  style: Styles.style16Bold,
                ),
                const Spacer(),
                Text(
                  "925",
                  style: Styles.style16Bold.copyWith(color: Colorrs.kCyan),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
