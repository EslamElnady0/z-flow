import 'package:flutter/material.dart';
import 'package:z_flow1/core/services/firebase_auth.dart';
import 'package:z_flow1/core/services/firebase_firestore.dart';
import 'package:z_flow1/core/util/context_helpers.dart';
import 'package:z_flow1/features/auth/presentaion/widgets/custom_auth_button.dart';
import 'package:z_flow1/features/auth/presentaion/widgets/custom_textformfield.dart';

import '../../data/models/user_model.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;

  const SignUpForm(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.formKey});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isPassword1 = true;
  bool isPassword2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              controller: widget.firstNameController,
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
                controller: widget.lastNameController,
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
              controller: widget.emailController,
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
              controller: widget.passwordController,
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
              isPassword: isPassword1,
              onTap: () {
                setState(() {
                  isPassword1 = !isPassword1;
                });
              },
              suffixIcon:
                  isPassword1 == true ? Icons.visibility : Icons.visibility_off,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: context.height * 0.0295566502463054,
            ),
            CustomTextFormField(
              controller: widget.confirmPasswordController,
              validate: (data) {
                if (data != widget.passwordController.text) {
                  return "passwords dosn't match";
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
              suffixIcon:
                  isPassword2 == true ? Icons.visibility : Icons.visibility_off,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: context.height * 0.0640394088669951,
            ),
            CustomAuthButton(
                title: "Sign up",
                onTap: () async {
                  if (widget.formKey.currentState!.validate()) {
                    FireBaseAuthService firebaseAuthService =
                        FireBaseAuthService();

                    await firebaseAuthService.signUpWithNormalEmail(
                        email: widget.emailController.text,
                        password: widget.passwordController.text,
                        context: context);
                    UserModel userModel = UserModel(
                      firstName: widget.firstNameController.text,
                      lastName: widget.lastNameController.text,
                      email: widget.emailController.text,
                      uid: firebaseAuthService.auth.currentUser!.uid,
                    );
                    await FirebaseFirestoreServices()
                        .addUserToFirestore(userModel: userModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                }),
          ],
        ),
      ),
    );
  }
}
