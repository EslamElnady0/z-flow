import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/presentation/screens/habits%20screens/add_habit_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/habits_screen_bodies.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHabitCubit, GetHabitState>(
      builder: (context, state) {
        if (context.read<GetHabitCubit>().runningHabitsList.isEmpty &&
            context.read<GetHabitCubit>().completedHabitsList.isEmpty) {
          return Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              const TitleTextWidget(
                text: "انشاء عادات جديدة اليوم",
              ),
              SizedBox(
                height: 8.h,
              ),
              SvgPicture.asset(
                "assets/images/habits_activities.svg",
                height: 128.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              const Spacer(),
              CustomButton(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const AddHabitScreen())),
                text: "إضافة عادة جديدة",
              ),
            ],
          );
        } else if (context.read<GetHabitCubit>().runningHabitsList.isEmpty &&
            context.read<GetHabitCubit>().completedHabitsList.isNotEmpty) {
          return OnlyOneHabitListEmptyBody(
            text: "عادات مكتملة",
            habitList: context.read<GetHabitCubit>().completedHabitsList,
          );
        } else if (context.read<GetHabitCubit>().runningHabitsList.isNotEmpty &&
            context.read<GetHabitCubit>().completedHabitsList.isEmpty) {
          return OnlyOneHabitListEmptyBody(
            text: "عادات مستمرة",
            habitList: context.read<GetHabitCubit>().runningHabitsList,
          );
        } else {
          return NoEmptyHabitListsBody(context: context);
        }
      },
    );
  }
}
