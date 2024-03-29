import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/features/home/presentation/widgets/add_habit_form.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  late TextEditingController _habitController;
  late TextEditingController _deadlineController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _habitController = TextEditingController();
    _deadlineController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _habitController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

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
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: AddHabitForm(
                        formKey: formKey,
                        habitController: _habitController,
                        deadlineController: _deadlineController))
              ],
            )),
      ),
    );
  }
}
