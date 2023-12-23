
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase_auth/firebase_auth.dart';
import 'package:cyberbee_web/presentation/main/main_screen.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonAuth extends StatelessWidget {
  const LoginButtonAuth({
    super.key,
    required TextEditingController otp,
  }) : _otp = otp;

  final TextEditingController _otp;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: () {
        MyFirebaseAuth.verifyOTP(
          smsCode: _otp.text,
          context: context,
        ).then((value) {
          if (value.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: providers,
                  child: MainScreen(),
                ),
              ),
            );
          }
        });
      },
      content: 'Login',
    );
  }
}
