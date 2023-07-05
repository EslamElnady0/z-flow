
import 'package:flutter/material.dart';
import 'package:z_flow1/screens/auth_screen.dart';
import 'package:z_flow1/screens/login_screen.dart';
import 'package:z_flow1/screens/motavation_splash_screen.dart';
import 'package:z_flow1/screens/password_recovery_screen.dart';
import 'package:z_flow1/screens/signup_screen.dart';
import 'package:z_flow1/screens/splash_screen.dart';
import 'package:z_flow1/screens/tasks_screen.dart';

main(){

  runApp(const ZFlowApp());
}
class ZFlowApp extends StatelessWidget {
  const ZFlowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      fontFamily: "Inter",

      ),
      routes: {
        AuthScreen.pageName:(context)=>const AuthScreen(),
        LogInScreen.pageName:(context)=>const LogInScreen(),
        SignUpScreen.pageName:(context)=>const SignUpScreen(),
        PasswordRecoveryScreen.pageName:(context)=>const PasswordRecoveryScreen(),
        MotivationScreen.pageName:(context)=>const MotivationScreen(),
        TasksScreen.pageName:(context)=>const TasksScreen(),
      },
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
    );
  }
}
