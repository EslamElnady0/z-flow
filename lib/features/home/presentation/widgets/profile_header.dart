import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow1/core/services/firebase_auth.dart';
import 'package:z_flow1/core/styles/styles.dart';
import 'package:z_flow1/features/auth/presentaion/screens/login_screen.dart';
import 'package:z_flow1/features/home/presentation/widgets/custom_auth_button.dart';
import 'package:z_flow1/features/home/presentation/widgets/google_registration_button.dart';

import '../../../auth/presentaion/screens/signup_screen.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    FireBaseAuthService firebaseAuthService = FireBaseAuthService();
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        Image.asset(
          "assets/images/default_user.png",
          height: 88.h,
        ),
        firebaseAuthService.auth.currentUser == null ||
                firebaseAuthService.auth.currentUser!.isAnonymous
            ? Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      CustomAuthAccountButton(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.pageName);
                        },
                        text: "Sign up",
                      ),
                      SizedBox(
                        width: 19.w,
                      ),
                      CustomAuthAccountButton(
                        onTap: () {
                          Navigator.pushNamed(context, LogInScreen.pageName);
                        },
                        text: "Log in",
                      ),
                      const Spacer()
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GoogleRegistrationButton(
                    onTap: () async {
                      await FireBaseAuthService()
                          .signInWithGoogle(context: context);
                      if (!firebaseAuthService.auth.currentUser!.isAnonymous) {
                        setState(() {});
                      }
                    },
                  ),
                ],
              )
            : Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(firebaseAuthService.auth.currentUser!.email!,
                      style: Styles.style16Bold),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomAuthAccountButton(
                    text: "Sign out",
                    onTap: () async {
                      await firebaseAuthService.signOutUser(context: context);
                    },
                  )
                ],
              )
      ],
    );
  }
}
