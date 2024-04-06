import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:total_x_assignment/view/pages/otp_page/otp_page.dart';
import 'package:total_x_assignment/view/pages/user_page/user_list_page.dart';

class OTPverificationService {
  static sendCode(String phoneNumber, BuildContext context) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OTPPage(
                  verificationId: verificationId,
                  phoneNumber: phoneNumber,
                ),
              ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error:$e")));
      }
    }
  }

  static signIn(
      String verificationId, String otpCode, BuildContext context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const UserPage(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("SignIn error")));
      }
    } catch (e) {
      log(e.toString());

      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("SignIn error")));
      }
    }
  }
}
