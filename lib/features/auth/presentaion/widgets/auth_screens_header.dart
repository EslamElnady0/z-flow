import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:z_flow1/core/util/context_helpers.dart';

class AuthScreensHeader extends StatelessWidget {
  const AuthScreensHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
          height: 20.h,
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
