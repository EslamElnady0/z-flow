import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow1/core/constants/contstants.dart';
import 'package:z_flow1/core/services/local_notifications.dart';
import 'package:z_flow1/core/theme/theme.dart';
import 'package:z_flow1/features/auth/presentaion/screens/auth_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/login_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/motavation_splash_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/password_recovery_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/signup_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/splash_screen.dart';
import 'package:z_flow1/features/drawer/data/cubits/add%20target%20cubit/add_target_cubit.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20favourite%20cubit/get_favourite_cubit.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20target%20cubit/get_target_cubit.dart';
import 'package:z_flow1/features/drawer/data/models/target%20model/target_model.dart';
import 'package:z_flow1/features/home/data/cubit/add%20habit%20cubit/add_habit_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/add%20task%20cubit/add_task_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20habit%20cubit/get_habit_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/get%20task%20cubit/get_task_cubit.dart';
import 'package:z_flow1/features/home/data/cubit/usage%20cubit/usage_cubit.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotifications.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(TargetModelAdapter());
  await Hive.openBox<TaskModel>(Constants.tasksBox);
  await Hive.openBox<HabitModel>(Constants.habitBox);
  await Hive.openBox<TargetModel>(Constants.targetBox);
  await Hive.openBox(Constants.constsBox);
  runApp(const ZFlowApp());
}

class ZFlowApp extends StatelessWidget {
  const ZFlowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AddTaskCubit()),
            BlocProvider(
                create: (context) => GetTaskCubit()
                  ..getTasks()
                  ..getSpecificDayTasks(
                    DateTime.now(),
                  )),
            BlocProvider(
                create: (context) => GetFavouriteCubit()
                  ..getFavouriteTasks()
                  ..getFavouriteHabits()),
            BlocProvider(create: (context) => AddHabitCubit()),
            BlocProvider(create: (context) => GetHabitCubit()..getHabits()),
            BlocProvider(create: (context) => AddTargetCubit()),
            BlocProvider(create: (context) => UsageCubit()),
            BlocProvider(create: (context) => GetTargetCubit()..getTargets()),
          ],
          child: MaterialApp(
              locale: const Locale("en-US"),
              theme: AppTheme.lightTheme,
              routes: {
                AuthScreen.pageName: (context) => const AuthScreen(),
                LogInScreen.pageName: (context) => const LogInScreen(),
                SignUpScreen.pageName: (context) => const SignUpScreen(),
                PasswordRecoveryScreen.pageName: (context) =>
                    const PasswordRecoveryScreen(),
                MotivationSplashScreen.pageName: (context) =>
                    const MotivationSplashScreen(),
                HomeScreen.pageName: (context) => const HomeScreen(),
              },
              debugShowCheckedModeBanner: false,
              home: const SplashScreen()),
        );
      }),
    );
  }
}
