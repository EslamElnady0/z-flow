import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/features/home/presentation/widgets/add_task_form.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  //bool hasInternet = false;
  // late StreamSubscription internetSubscription;
  late TextEditingController _taskController;
  late TextEditingController _deadlineController;
  late TextEditingController _notesController;
  late TextEditingController _sideTaskController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _taskController = TextEditingController();
    _deadlineController = TextEditingController();
    _notesController = TextEditingController();
    _sideTaskController = TextEditingController();

    // internetSubscription =
    //     InternetConnectionChecker().onStatusChange.listen((status) {
    //   final hasInternetConnection =
    //       status == InternetConnectionStatus.connected;
    //   setState(() {
    //     hasInternet = hasInternetConnection;
    //   });
    // });
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
                  child: AddTaskForm(
                      //  hasInternet: hasInternet,
                      // internetSubscription: internetSubscription,
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
