import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:z_flow1/core/util/methods.dart';
import 'package:z_flow1/features/auth/presentaion/screens/motavation_splash_screen.dart';

class FireBaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  signUpWithNormalEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        Navigator.pushReplacementNamed(
            context, MotivationSplashScreen.pageName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          HelperMethods.showSnackBar(
              context: context, message: 'The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          HelperMethods.showSnackBar(
              context: context,
              message: 'The account already exists for that email.');
        }
      }
    } catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(context: context, message: e.toString());
      }
    }
  }

  signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        Navigator.pushReplacementNamed(
            context, MotivationSplashScreen.pageName);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        if (context.mounted) {
          HelperMethods.showSnackBar(
              context: context,
              message: 'Wrong email or password. consider checking both');
        }
      } else {
        if (context.mounted) {
          HelperMethods.showSnackBar(context: context, message: e.code);
        }
      }
    } catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(context: context, message: e.toString());
      }
    }
  }

  signOut({required BuildContext context}) async {
    try {
      await auth.signOut();
    } catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(context: context, message: e.toString());
      }
    }
  }
}
