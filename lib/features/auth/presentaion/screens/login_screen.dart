import 'package:flutter/material.dart';
import 'package:z_flow1/core/services/firebase_auth.dart';
import 'package:z_flow1/features/auth/presentaion/screens/password_recovery_screen.dart';
import 'package:z_flow1/core/util/context_helpers.dart';

import '../widgets/auth_footer.dart';
import '../widgets/auth_screens_header.dart';
import '../widgets/custom_auth_button.dart';
import '../widgets/custom_background.dart';
import '../widgets/custom_textformfield.dart';

class LogInScreen extends StatefulWidget {
  static String pageName = "loginScreen";

  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isPassword = true;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomBackgroundContainer(
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            child: Column(
              children: [
                const AuthScreensHeader(),
                Padding(
                    padding: EdgeInsets.only(
                        right: context.width * 0.112,
                        left: context.width * 0.112,
                        top: context.height * 0.0788177339901478),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextFormField(
                            controller: emailController,
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
                            controller: passwordController,
                            validate: (data) {
                              if (data!.isEmpty) {
                                return "this field is required";
                              } else if (data.length < 6) {
                                return "password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            },
                            autoValidateMode: autoValidateMode,
                            hint: 'Password',
                            prefixIcon: Icons.lock_outline_rounded,
                            isPassword: isPassword,
                            onTap: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            suffixIcon: isPassword == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PasswordRecoveryScreen.pageName);
                              },
                              child: const Text(
                                "forgot password?",
                                style: TextStyle(color: Colors.white),
                              )),
                          SizedBox(
                            height: context.height * 0.1,
                          ),
                          Center(
                            child: CustomAuthButton(
                                title: "Log in",
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    await FireBaseAuthService()
                                        .signInWithNormalEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            context: context);
                                  } else {
                                    autoValidateMode = AutovalidateMode.always;
                                    setState(() {});
                                  }
                                }),
                          ),
                        ],
                      ),
                    )),
                const Spacer(),
                const AuthFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
