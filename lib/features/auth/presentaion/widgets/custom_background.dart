import 'package:flutter/material.dart';



class CustomBackgroundContainer extends StatelessWidget {
  final Widget child;
  const CustomBackgroundContainer({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.cyan,
              Color(0xff008971),
              Color(0xff006456),
              Color(0xff011720),
            ],
            stops: [
              0.05,0.2,0.6,0.8,1
            ]
          )),
      child: child
    );
  }
}
