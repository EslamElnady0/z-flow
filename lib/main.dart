import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/features/auth/presentaion/screens/auth_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/login_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/motavation_splash_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/password_recovery_screen.dart';
import 'package:z_flow1/features/auth/presentaion/screens/signup_screen.dart';
import 'package:z_flow1/features/tasks/presentation/screens/home_screen.dart';

Future<void> main() async {
    await Hive.initFlutter();

  //Hive.registerAdapter(NoteModelAdapter());
  // await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const ZFlowApp());
}

class ZFlowApp extends StatelessWidget {
  const ZFlowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context, child) {
        return MaterialApp(
          locale: const Locale("en-US"),
          theme: ThemeData(
              fontFamily: "Inter",
              scaffoldBackgroundColor: Colorrs.kBackground),
          routes: {
            AuthScreen.pageName: (context) => const AuthScreen(),
            LogInScreen.pageName: (context) => const LogInScreen(),
            SignUpScreen.pageName: (context) => const SignUpScreen(),
            PasswordRecoveryScreen.pageName: (context) =>
                const PasswordRecoveryScreen(),
            MotivationScreen.pageName: (context) => const MotivationScreen(),
            HomePage.pageName: (context) => const HomePage(),
          },
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      }),
    );
  }
}
