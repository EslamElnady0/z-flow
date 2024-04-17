import 'package:flutter/material.dart';
import 'package:z_flow1/core/util/context_helpers.dart';
import 'package:z_flow1/features/auth/presentaion/widgets/sign_up_form.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_screens_header.dart';
import '../widgets/custom_background.dart';

class SignUpScreen extends StatefulWidget {
  static String pageName = "signupScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                child: SignUpForm(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  formKey: formKey,
                )),
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
