import 'package:flutter/material.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_alert_dialog.dart';

showAnimatedDialog(BuildContext context) {
  showGeneralDialog(
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeIn.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * -600, 0.0),
          child: const CustomAlertDialog(),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
