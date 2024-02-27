import 'package:flutter/material.dart';

import 'package:z_flow1/core/util/context_helpers.dart';

import '../widgets/auth_footer.dart';
import '../widgets/auth_screens_header.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_background.dart';
import '../widgets/custom_textformfield.dart';
import 'motavation_splash_screen.dart';

class SignUpScreen extends StatefulWidget {
  static String pageName = "signupScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isPassword1 = true;
  bool isPassword2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const AuthScreensHeader(),
            Padding(
              padding: EdgeInsets.only(
                right: context.width * 0.112,
                left: context.width * 0.112,
                top: context.height * 0.04,
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        validate: (data) {
                          if (data!.isEmpty) {
                            return "this field is required";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        hint: "FirstName",
                        prefixIcon: Icons.account_circle_outlined,
                        isPassword: false,
                        autoValidateMode: autoValidateMode,
                      ),
                      SizedBox(
                        height: context.height * 0.0295566502463054,
                      ),
                      CustomTextFormField(
                          validate: (data) {
                            if (data!.isEmpty) {
                              return "this field is required";
                            }
                            return null;
                          },
                          autoValidateMode: autoValidateMode,
                          keyboardType: TextInputType.text,
                          hint: "Last Name",
                          prefixIcon: Icons.account_circle_outlined,
                          isPassword: false),
                      SizedBox(
                        height: context.height * 0.0295566502463054,
                      ),
                      CustomTextFormField(
                        validate: (data) {
                          if (data!.isEmpty) {
                            return "this field is required";
                          }
                          return null;
                        },
                        autoValidateMode: autoValidateMode,
                        keyboardType: TextInputType.emailAddress,
                        hint: 'Email',
                        prefixIcon: Icons.email_outlined,
                        isPassword: false,
                      ),
                      SizedBox(
                        height: context.height * 0.0295566502463054,
                      ),
                      CustomTextFormField(
                        validate: (data) {
                          if (data!.isEmpty) {
                            return "this field is required";
                          }
                          return null;
                        },
                        autoValidateMode: autoValidateMode,
                        hint: 'Password',
                        prefixIcon: Icons.lock_outline_rounded,
                        isPassword: isPassword1,
                        onTap: () {
                          setState(() {
                            isPassword1 = !isPassword1;
                          });
                        },
                        suffixIcon: isPassword1 == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: context.height * 0.0295566502463054,
                      ),
                      CustomTextFormField(
                        validate: (data) {
                          if (data!.isEmpty) {
                            return "this field is required";
                          }
                          return null;
                        },
                        autoValidateMode: autoValidateMode,
                        hint: 'Confirm Password',
                        prefixIcon: Icons.lock_outline_rounded,
                        isPassword: isPassword2,
                        onTap: () {
                          setState(() {
                            isPassword2 = !isPassword2;
                          });
                        },
                        suffixIcon: isPassword2 == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: context.height * 0.0640394088669951,
                      ),
                      CustomAuthButton(
                          title: "Sign up",
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(
                                  context, MotivationSplashScreen.pageName);
                            } else {
                              autoValidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.0443349753694581,
            ),
            const AuthFooter()
          ],
        ),
      )),
    );
  }
}
