import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase_auth/firebase_auth.dart';
import 'package:cyberbee_web/presentation/main/main_screen.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: Responsive.isMobile(context) ? double.infinity : 400,
            height: 600,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Cyber Bee',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: _phoneNumber,
                    maxLength: 10,
                    hintText: 'Phone number',
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'Please enter the number';
                      } else if (v.length != 10) {
                        return 'Wrong number';
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: CustomTextFormField(
                          maxLength: 6,
                          controller: _otp,
                          hintText: 'Otp',
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty || p0.length != 6) {
                              return 'Wrong OTP';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 20),
                        child: CustomTextButton(
                          onTap: () {
                            MyFirebaseAuth.signInWithPhoneNumber(
                              context,
                              _phoneNumber.text,
                            );
                          },
                          content: 'Send otp',
                        ),
                      ),
                    ],
                  ),
                  CustomTextButton(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
