
import 'package:cyberbee_web/core/firebase_auth/firebase_auth.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class OtpPartAuth extends StatelessWidget {
  const OtpPartAuth({
    super.key,
    required TextEditingController otp,
    required TextEditingController phoneNumber,
  }) : _otp = otp, _phoneNumber = phoneNumber;

  final TextEditingController _otp;
  final TextEditingController _phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
