import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/colors/colorrs.dart';
import 'package:z_flow1/features/drawer/data/cubits/add%20target%20cubit/add_target_cubit.dart';
import 'package:z_flow1/features/drawer/data/cubits/get%20target%20cubit/get_target_cubit.dart';
import 'package:z_flow1/features/drawer/data/models/target%20model/target_model.dart';
import 'package:z_flow1/features/drawer/presentation/widgets/add_target_textfield.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_appbar.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_cancel_save_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/title_text_widget.dart';

import '../../../../../core/services/firebase_auth.dart';
import '../../../../../core/services/firebase_firestore.dart';

class AddTargetScreen extends StatefulWidget {
  const AddTargetScreen({super.key});

  @override
  State<AddTargetScreen> createState() => _AddTargetScreenState();
}

class _AddTargetScreenState extends State<AddTargetScreen> {
  late TextEditingController _targetController;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _targetController = TextEditingController();

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
                      text: "رائع أنت الأن علي وشك كتابة أهداف جديدة!"),
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
                        text: "الغاء",
                        onTap: () => Navigator.pop(context),
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
                            TargetModel targetModel = TargetModel(
                                title: _targetController.text,
                                createdAt: DateTime.now().toString());
                            context
                                .read<AddTargetCubit>()
                                .addTarget(targetModel);
                            context.read<GetTargetCubit>().getTargets();
                            //  if (hasInternet) {
                            Navigator.pop(context);
                            await firestoreServices.addTargetToFirestore(
                                targetModel: targetModel, uid: uid);
                            //    }
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
