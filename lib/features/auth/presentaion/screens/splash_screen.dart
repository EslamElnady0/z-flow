import 'package:flutter/material.dart';
import 'package:z_flow1/core/services/firebase_auth.dart';

import 'package:z_flow1/core/util/context_helpers.dart';
import 'package:z_flow1/features/home/presentation/screens/home_screen.dart';

import '../widgets/custom_background.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.pushReplacementNamed(
          context,
          FireBaseAuthService().auth.currentUser == null
              ? AuthScreen.pageName
              : HomeScreen.pageName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Image.asset("assets/images/11 1.png"),
          const Spacer(flex: 1),
          Image.asset(
            "assets/images/Z-Flow.png",
            height: context.height * 0.04711330049,
            fit: BoxFit.fill,
            width: context.width * 0.36266666666,
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
