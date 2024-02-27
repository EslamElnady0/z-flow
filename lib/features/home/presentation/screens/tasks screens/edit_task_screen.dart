import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/features/home/data/models/tasks%20model/task_model.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/edit_task_form.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel taskModel;
  const EditTaskScreen({super.key, required this.taskModel});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _taskController;
  late TextEditingController _deadlineController;
  late TextEditingController _notesController;
  late TextEditingController _sideTaskController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _taskController = TextEditingController(text: widget.taskModel.title);
    _deadlineController =
        TextEditingController(text: widget.taskModel.deadline);
    _notesController = TextEditingController(text: widget.taskModel.notes);
    _sideTaskController =
        TextEditingController(text: widget.taskModel.sideTask);
    super.initState();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _deadlineController.dispose();
    _notesController.dispose();
    _sideTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  child: EditTaskForm(
                      taskModel: widget.taskModel,
                      formKey: formKey,
                      taskController: _taskController,
                      deadlineController: _deadlineController,
                      notesController: _notesController,
                      sideTaskController: _sideTaskController),
                )
              ],
            )),
      ),
    );
  }
}
