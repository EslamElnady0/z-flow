import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/presentation/screens/habits%20screens/add_habit_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/habit_item.dart';

// ignore: must_be_immutable
class OnlyOneHabitListEmptyBody extends StatelessWidget {
  final String text;
  List<HabitModel> habitList;
  OnlyOneHabitListEmptyBody(
      {super.key, required this.text, required this.habitList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 19.h,
        ),
        Text(
          text,
          style: Styles.style12,
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: habitList.length,
            itemBuilder: (context, index) {
              return HabitItem(habitModel: habitList[index]);
            },
          ),
        ),
        CustomButton(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddHabitScreen()));
          },
          text: "إضافة عادة جديدة",
        )
      ],
    );
  }
}

class NoEmptyHabitListsBody extends StatefulWidget {
  final BuildContext context;
  const NoEmptyHabitListsBody({
    super.key,
    required this.context,
  });

  @override
  State<NoEmptyHabitListsBody> createState() => _NoEmptyHabitListsBodyState();
}

class _NoEmptyHabitListsBodyState extends State<NoEmptyHabitListsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 19.h,
        ),
        Text(
          "عادات مستمرة",
          style: Styles.style12,
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          flex: 2,
          child: ListView.builder(
            itemCount:
                widget.context.read<GetHabitCubit>().runningHabitsList.length,
            itemBuilder: (context, index) {
              return HabitItem(
                  habitModel: widget.context
                      .read<GetHabitCubit>()
                      .runningHabitsList[index]);
            },
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          "عادات مكتملة",
          style: Styles.style12,
        ),
        SizedBox(
          height: 16.h,
        ),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount:
                widget.context.read<GetHabitCubit>().completedHabitsList.length,
            itemBuilder: (context, index) {
              return HabitItem(
                  habitModel: widget.context
                      .read<GetHabitCubit>()
                      .completedHabitsList[index]);
            },
          ),
        ),
        CustomButton(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AddHabitScreen()));
          },
          text: "إضافة عادة جديدة",
        )
      ],
    );
  }
}
