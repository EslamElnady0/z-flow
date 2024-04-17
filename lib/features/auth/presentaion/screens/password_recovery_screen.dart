import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/services/firebase_auth.dart';
import 'package:z_flow1/core/util/context_helpers.dart';

import '../widgets/auth_footer.dart';
import '../widgets/auth_screens_header.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_background.dart';
import '../widgets/custom_textformfield.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  static String pageName = "passRecovery";

  const PasswordRecoveryScreen({Key? key}) : super(key: key);

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            child: Column(
              children: [
                const AuthScreensHeader(),
                SizedBox(
                  height: context.height * 0.0283251231527094,
                ),
                Text(
                  "Forgot Your Password?",
                  style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: context.height * 0.0874384236453202),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.width * 0.112),
                  child: CustomTextFormField(
                    controller: emailController,
                    autoValidateMode: autoValidateMode,
                    validate: (data) {
                      if (data!.isEmpty) {
                        return "this field is required";
                      } else if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(data)) {
                        return "please enter a valid email";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    hint: 'Email',
                    prefixIcon: Icons.email_outlined,
                    isPassword: false,
                  ),
                ),
                SizedBox(height: context.height * 0.0874384236453202),
                CustomAuthButton(
                    width: 200.w,
                    title: "Reset Password",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        FireBaseAuthService firebaseAuthService =
                            FireBaseAuthService();

                        await firebaseAuthService.resetPassword(
                            email: emailController.text, context: context);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                      }
                    }),
                const Spacer(),
                const AuthFooter()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
