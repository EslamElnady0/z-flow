import 'package:flutter/material.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/features/home/presentation/screens/home_screen.dart';
import 'package:z_flow1/core/util/context_helpers.dart';

class MotivationSplashScreen extends StatefulWidget {
  static String pageName = 'motivateScreen';
  const MotivationSplashScreen({Key? key}) : super(key: key);

  @override
  State<MotivationSplashScreen> createState() => _MotivationSplashScreenState();
}

class _MotivationSplashScreenState extends State<MotivationSplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.pushReplacementNamed(context, HomeScreen.pageName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorrs.kWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: context.width * 0.672,
                width: context.width * 0.672,
                child: Image.asset("assets/images/motivate.gif")),
            SizedBox(
              height: context.height * 0.0455665024630542,
            ),
            const Text(
              "! استمر ",
              style: TextStyle(fontSize: 30, color: Colorrs.kCyan),
            ),
            const Text(
              "انت شخص رائع",
              style: TextStyle(fontSize: 30, color: Colorrs.kCyan),
            ),
          ],
        ),
      ),
    );
  }
}
