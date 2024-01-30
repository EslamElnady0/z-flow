import 'package:flutter/material.dart';

import 'package:z_flow1/core/util/context_helpers.dart';

class CustomAuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomAuthButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 0.4533333333333333,
        height: context.height * 0.0665024630541872,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
