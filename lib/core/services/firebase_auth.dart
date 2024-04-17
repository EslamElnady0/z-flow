import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:z_flow1/core/util/methods.dart';
import 'package:z_flow1/features/auth/presentaion/screens/auth_screen.dart';
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

///////////////////////////////////////////////////////////////////////////////////////
  signInWithNormalEmailAndPassword(
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
///////////////////////////////////////////////////////////////////////////////////////

  signInWithGoogle({required BuildContext context}) async {
    //begin sign in process

    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain auth details
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    //create new credential for user
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    //sign in normally with firebase
    GoogleAuthProvider provider = GoogleAuthProvider();
    try {
      await FirebaseAuth.instance.signInWithProvider(provider);
      if (context.mounted) {
        Navigator.pushReplacementNamed(
            context, MotivationSplashScreen.pageName);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(
            context: context, message: e.message.toString());
      }
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  signInAnonymously({required BuildContext context}) async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(context: context, message: e.toString());
      }
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  resetPassword({required String email, required BuildContext context}) async {
    try {
      await auth.sendPasswordResetEmail(email: email.trim());
      if (context.mounted) {
        HelperMethods.showSnackBar(
            context: context,
            message: "Password reset email sent successfully");
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(
            context: context, message: e.message.toString());
      }
    } catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(context: context, message: e.toString());
      }
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  signOutUser({required BuildContext context}) async {
    try {
      await auth.signOut();
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, AuthScreen.pageName, (route) => false);
      }
    } catch (e) {
      if (context.mounted) {
        HelperMethods.showSnackBar(context: context, message: e.toString());
      }
    }
  }
}
