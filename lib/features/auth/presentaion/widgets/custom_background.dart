import 'package:flutter/material.dart';
import 'package:z_flow1/core/constants/contstants.dart';

class CustomBackgroundContainer extends StatelessWidget {
  final Widget child;
  const CustomBackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: Constants.zFlowGradient),
        child: child);
  }
}
