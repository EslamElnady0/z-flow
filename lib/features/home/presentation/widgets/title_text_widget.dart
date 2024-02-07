import 'package:flutter/material.dart';
import 'package:z_flow1/core/styles/styles.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TitleTextWidget({
    this.style,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.50,
      child: Text(
        text,
        style: style ?? Styles.style12,
        textAlign: TextAlign.center,
      ),
    );
  }
}
