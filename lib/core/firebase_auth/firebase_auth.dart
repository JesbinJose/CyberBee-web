import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/presentation/widgets/show_snakbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyFirebaseAuth {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static String _verificationId = '';
  static Future<bool> signInWithPhoneNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    bool isVerificationOK = false;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) async {
        _verificationId = verificationId;
        isVerificationOK = true;
        mySnakbar(context, 'Otp has been Send');
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        await Future.delayed(
          const Duration(
            minutes: 5,
          ),
        );
      },
    );
    return isVerificationOK;
  }

  static Future<String> verifyOTP(
      {required String smsCode, required context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: smsCode,
      );
      User? user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        final admin = (await FirebaseFirestore.instance
                .collection('users')
                .where('isAdmin', isEqualTo: true)
                .get())
            .docs
            .any((e) => e.id == user.uid);
        if (admin == true) {
          mySnakbar(context, 'Oke you are admin');
          return user.uid;
        }
      }
    } on FirebaseAuthException catch (e) {
      mySnakbar(context, e.message.toString());
    }
    return '';
  }

  static Future<bool> checkUserIsLoggedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    }
    final admin = (await FirebaseFirestore.instance
            .collection('users')
            .where('isAdmin', isEqualTo: true)
            .get())
        .docs
        .any((e) => e.id == user.uid);
    return admin;
  }
}
