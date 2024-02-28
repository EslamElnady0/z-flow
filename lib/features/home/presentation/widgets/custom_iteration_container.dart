import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';

// ignore: must_be_immutable
class CustomIterationContainer extends StatefulWidget {
  final HabitModel habitModel;
  const CustomIterationContainer({super.key, required this.habitModel});

  @override
  State<CustomIterationContainer> createState() =>
      _CustomIterationContainerState();
}

class _CustomIterationContainerState extends State<CustomIterationContainer> {
  String textChoice() {
    switch (widget.habitModel.iteration) {
      case 7:
        return Iteration.dayly.name;
      case 6:
        return Iteration.sixTimes.name;

      case 5:
        return Iteration.fiveTimes.name;

      case 4:
        return Iteration.fourTimes.name;

      case 3:
        return Iteration.threeTimes.name;

      default:
        return Iteration.zeroTimes.name;
    }
  }

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
            textChoice(),
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
                        var index = e.key;
                        var value = e.value;
                        return PopupMenuItem(
                            onTap: () {
                              context
                                  .read<GetHabitCubit>()
                                  .updateIterationContainer(
                                      index, widget.habitModel);
                            },
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
