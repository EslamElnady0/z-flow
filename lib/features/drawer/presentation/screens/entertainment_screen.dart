import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/custom_white_container.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

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
              text: "إقتراحات ترفيهيه",
              style: Styles.style16,
            ),
            SizedBox(
              height: 49.h,
            ),
            const CustomWhiteContainer(
                text:
                    "الخروج مع الأصدقاء وقضاء الوقت معهم والقيام بأنشطة مشتركة"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Image.asset(
                "assets/images/entertainment cheering.png",
                height: 332.h,
                width: 332.w,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            const CustomCancelSaveButton(color: Colorrs.kCyan, text: "أخري"),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
