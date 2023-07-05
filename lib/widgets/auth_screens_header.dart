import 'package:flutter/material.dart';

import 'package:z_flow1/util/context_helpers.dart';

class AuthScreensHeader extends StatelessWidget {
  const AuthScreensHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(top: context.height * 0.07374384236),
        child: Image.asset(
          "assets/images/11 1.png",
          width: context.width * 0.5,
        ),
      ),
      Image.asset(
        "assets/images/Z-Flow.png",
        width: context.width * 0.2,
      ),
      const SizedBox(
        height: 20,
      ),
      const Divider(
        color: Colors.white,
      ),
    ],);
  }
}
