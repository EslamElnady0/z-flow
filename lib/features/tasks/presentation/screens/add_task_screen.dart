import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/add_task_textfield.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/tasks/presentation/widgets/title_text_widget.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: buildCustomAppBar(
          leading: Icons.arrow_back,
          onLeadingPressed: () => Navigator.pop(context),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              SizedBox(
                height: 24.h,
              ),
              TitleTextWidget(
                text: "إضافة مهمة جديدة",
                style: Styles.style24,
              ),
              SizedBox(
                height: 24.h,
              ),
              const AddTaskTextField(
                hintText: 'المهمة',
                suffixIcon: FontAwesomeIcons.listCheck,
              ),
              SizedBox(
                height: 16.h,
              ),
              const AddTaskTextField(
                hintText: 'تنتهي في.',
                suffixIcon: FontAwesomeIcons.calendarCheck,
              ),
              SizedBox(
                height: 16.h,
              ),
              const AddTaskTextField(
                hintText: 'ملاحظات',
                suffixIcon: FontAwesomeIcons.noteSticky,
              ),
              SizedBox(
                height: 16.h,
              ),
              const AddTaskTextField(
                hintText: 'مهمة فرعية',
                suffixIcon: FontAwesomeIcons.hubspot,
              ),
              SizedBox(
                height: 16.h,
              ),
              const Spacer(
                flex: 4,
              ),
              Row(
                children: [
                  CustomCancelSaveButton(
                    color: Colors.white,
                    text: 'الغاء',
                    onTap: () => Navigator.pop(context),
                  ),
                  const Spacer(),
                  CustomCancelSaveButton(
                    color: Colorrs.kCyan,
                    text: 'حفظ',
                    onTap: () {},
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
