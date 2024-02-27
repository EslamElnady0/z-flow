import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/presentation/ui%20cubits/timer/timer_cubit.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class WorkSessionWorkingBody extends StatefulWidget {
  const WorkSessionWorkingBody({
    super.key,
  });

  @override
  State<WorkSessionWorkingBody> createState() => _WorkSessionWorkingBodyState();
}

class _WorkSessionWorkingBodyState extends State<WorkSessionWorkingBody> {
  late Timer timer;
  void startWorkingTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (context.read<TimerCubit>().workingCounter >= 0) {
        context.read<TimerCubit>().duration =
            Duration(seconds: context.read<TimerCubit>().workingCounter);
        context.read<TimerCubit>().workingCounter--;
        context.read<TimerCubit>().updateTimer();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startWorkingTimer();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              const TitleTextWidget(text: "في جلسة عمل"),
              SizedBox(
                height: 77.h,
              ),
              SizedBox(
                height: 226.h,
                width: 226.w,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        top: 3.h,
                        child: SizedBox(
                          width: 226.w,
                          height: 226.h,
                          child: CircularProgressIndicator(
                            value: (context.read<TimerCubit>().workingCounter /
                                context.read<TimerCubit>().workingSeconds),
                            strokeWidth: 15,
                            color: Colors.grey[400],
                          ),
                        )),
                    CircularProgressIndicator(
                      value: (context.read<TimerCubit>().workingCounter /
                          context.read<TimerCubit>().workingSeconds),
                      color: Colorrs.kCyan,
                      strokeWidth: 15,
                    ),
                    Center(
                      child: Text(
                        "${context.read<TimerCubit>().duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${context.read<TimerCubit>().duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                        style: Styles.style32,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  context.read<TimerCubit>().isPaused =
                      !context.read<TimerCubit>().isPaused;
                  if (context.read<TimerCubit>().isPaused) {
                    timer.cancel();
                    context.read<TimerCubit>().updateTimer();
                  } else {
                    startWorkingTimer();
                    context.read<TimerCubit>().updateTimer();
                  }
                },
                child: Container(
                    height: 60.h,
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [Constants.shadow]),
                    child: Icon(
                      context.read<TimerCubit>().isPaused
                          ? Icons.play_arrow
                          : Icons.pause,
                      color: Colorrs.kCyan,
                    )),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
