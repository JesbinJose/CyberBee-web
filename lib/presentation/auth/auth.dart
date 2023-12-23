import 'package:cyberbee_web/presentation/auth/widgets/login_button.dart';
import 'package:cyberbee_web/presentation/auth/widgets/otp_part.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:cyberbee_web/responsive.dart';
import 'package:flutter/material.dart';

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
                  OtpPartAuth(otp: _otp, phoneNumber: _phoneNumber),
                  LoginButtonAuth(otp: _otp),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
