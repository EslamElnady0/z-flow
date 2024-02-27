import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/custom_white_container.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class AdvicesScreen extends StatelessWidget {
  const AdvicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildCustomAppBar(
            leading: Icons.arrow_back,
            onLeadingPressed: () => Navigator.pop(context)),
        body: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            TitleTextWidget(
              text: "نصائح",
              style: Styles.style16,
            ),
            SizedBox(
              height: 49.h,
            ),
            const CustomWhiteContainer(
              text: 'قم بوضع خطة عمل تساعدك في تحقيق اهدافك',
            ),
            SizedBox(
              height: 49.h,
            ),
            Image.asset(
              "assets/images/advicesImage.png",
              height: 244.h,
            ),
            const Spacer(),
            const CustomCancelSaveButton(
              text: "أخري",
              color: Colorrs.kCyan,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
