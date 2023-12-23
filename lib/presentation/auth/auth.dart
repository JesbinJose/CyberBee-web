import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
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
        child: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
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
                children: [
                  CustomTextFormField(
                    maxLength: 6,
                    controller: _otp,
                    hintText: 'Otp',
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty || p0.length != 6) {
                        return 'Wrong OTP';
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
