import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:z_flow1/features/drawer/presentation/ui%20cubits/timer/timer_cubit.dart';
import 'package:z_flow1/features/drawer/presentation/ui%20cubits/work%20session/work_session_cubit.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/work_session_break_body.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/work_session_initial_body.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/work_session_working_body.dart';

import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';

class WorkSessionScreen extends StatelessWidget {
  const WorkSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => WorkSessionCubit(),
            ),
            BlocProvider(
              create: (context) => TimerCubit(),
            ),
          ],
          child: Scaffold(
            appBar: buildCustomAppBar(
              leading: Icons.arrow_back,
              onLeadingPressed: () => Navigator.pop(context),
            ),
            body: BlocBuilder<WorkSessionCubit, WorkSessionState>(
              builder: (context, state) {
                if (state is WorkSessionInitial) {
                  return const WorkSessionInitialBody();
                } else if (state is WorkSessionWorking) {
                  return BlocListener<TimerCubit, TimerState>(
                    listener: (context, state) {
                      if (context.read<TimerCubit>().workingCounter == 0) {
                        context.read<WorkSessionCubit>().startBreak();
                      }
                    },
                    child: const WorkSessionWorkingBody(),
                  );
                } else {
                  return BlocListener<TimerCubit, TimerState>(
                    listener: (context, state) {
                      if (context.read<TimerCubit>().breakCounter == 0) {
                        context.read<WorkSessionCubit>().backToInitial();
                        context.read<TimerCubit>().breakCounter = 5 * 60;
                        context.read<TimerCubit>().workingCounter = 25 * 60;
                      }
                    },
                    child: const WorkSessionBreakBody(),
                  );
                }
              },
            ),
          ),
        ));
  }
}
