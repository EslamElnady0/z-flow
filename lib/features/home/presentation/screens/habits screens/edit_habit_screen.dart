import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/features/home/data/models/habits%20model/habit_model.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/edit_habit_form.dart';

class EditHabitScreen extends StatefulWidget {
  final HabitModel habitModel;
  const EditHabitScreen({super.key, required this.habitModel});

  @override
  State<EditHabitScreen> createState() => _EditHabitScreenState();
}

class _EditHabitScreenState extends State<EditHabitScreen> {
  late TextEditingController _habitController;
  late TextEditingController _deadlineController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _habitController = TextEditingController(text: widget.habitModel.title);
    _deadlineController =
        TextEditingController(text: widget.habitModel.deadline);
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
                      child: EditHabitForm(
                          habitModel: widget.habitModel,
                          formKey: formKey,
                          habitController: _habitController,
                          deadlineController: _deadlineController))
                ],
              )),
        ));
  }
}
