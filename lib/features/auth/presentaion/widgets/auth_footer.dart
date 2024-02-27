import 'package:flutter/material.dart';
import 'package:z_flow1/features/home/presentation/screens/home_screen.dart';

import 'auth_bottom_screen_button.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      AuthBottomButtonBackwards(
          onTap: () {
            Navigator.pop(context);
          },
          title: "Back",
          icon: Icons.keyboard_double_arrow_left_outlined),
      const Spacer(),
      AuthBottomButtonForward(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomeScreen.pageName);
          },
          title: "Skip",
          icon: Icons.keyboard_double_arrow_right_outlined),
    ]);
  }
}
