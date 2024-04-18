import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20target%20cubit/get_target_cubit.dart';
import 'package:z_flow1/features/drawer/data/models/target%20model/target_model.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/add_target_textfield.dart';
import 'package:z_flow1/features/home/presentation/screens/home_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

import '../../../../../core/services/firebase_auth.dart';
import '../../../../../core/services/firebase_firestore.dart';

class EditTargetScreen extends StatefulWidget {
  final TargetModel targetModel;
  const EditTargetScreen({super.key, required this.targetModel});

  @override
  State<EditTargetScreen> createState() => _EditTargetScreenState();
}

class _EditTargetScreenState extends State<EditTargetScreen> {
  late TextEditingController _targetController;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _targetController = TextEditingController(text: widget.targetModel.title);
    super.initState();
  }

  @override
  void dispose() {
    _targetController.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  const TitleTextWidget(
                      text: "أنت الأن علي وشك تعديل هدف موجود بالفعل!"),
                  SizedBox(
                    height: 24.h,
                  ),
                  AddTargetTextField(
                    controller: _targetController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomCancelSaveButton(
                        color: Colors.white,
                        text: "حذف",
                        onTap: () async {
                          FirebaseFirestoreServices firestoreServices =
                              FirebaseFirestoreServices();
                          FireBaseAuthService fireBaseAuthService =
                              FireBaseAuthService();
                          String uid =
                              fireBaseAuthService.auth.currentUser!.uid;
                          if (hasInternet) {
                            await firestoreServices.deleteTargetFromFirestore(
                                targetModel: widget.targetModel, uid: uid);
                          }
                          widget.targetModel.delete();
                          if (context.mounted) {
                            context.read<GetTargetCubit>().getTargets();
                            Navigator.pop(context);
                          }
                        },
                      ),
                      const Spacer(),
                      CustomCancelSaveButton(
                        color: Colorrs.kCyan,
                        text: "حفظ",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            FirebaseFirestoreServices firestoreServices =
                                FirebaseFirestoreServices();
                            FireBaseAuthService fireBaseAuthService =
                                FireBaseAuthService();
                            String uid =
                                fireBaseAuthService.auth.currentUser!.uid;
                            widget.targetModel.title = _targetController.text;
                            widget.targetModel.save();

                            context.read<GetTargetCubit>().getTargets();
                            if (hasInternet) {
                              firestoreServices.editTargetInFirestore(
                                  targetModel: widget.targetModel, uid: uid);
                            }
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 75.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
