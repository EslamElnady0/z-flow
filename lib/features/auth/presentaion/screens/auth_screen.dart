import 'package:flutter/material.dart';

import 'package:z_flow1/features/auth/presentaion/screens/signup_screen.dart';
import 'package:z_flow1/features/home/presentation/screens/home_screen.dart';

import '../widgets/auth_bottom_screen_button.dart';
import '../widgets/auth_screens_header.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_background.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget {
  static String pageName = "authScreen";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
          child: Column(
        children: [
          const AuthScreensHeader(),
          const Spacer(
            flex: 2,
          ),
          CustomAuthButton(
            title: "Log in",
            onTap: () {
              Navigator.pushNamed(context, LogInScreen.pageName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomAuthButton(
            title: "Sign up",
            onTap: () {
              Navigator.pushNamed(context, SignUpScreen.pageName);
            },
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/google (2) 2.png"),
              const SizedBox(
                width: 20,
              ),
              Image.asset("assets/images/_Group_2.png")
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 16),
              child: AuthBottomButtonForward(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.pageName);
                },
                title: 'Skip',
                icon: Icons.keyboard_double_arrow_right_outlined,
              ))
        ],
      )),
    );
  }
}
