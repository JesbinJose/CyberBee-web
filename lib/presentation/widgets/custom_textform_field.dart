import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.textInputAction,
    this.minLine,
    this.maxLine = 1,
    this.readOnly = false,
    this.validator,
    this.isNumOnly = false,
  }) : _courseName = controller;

  final String hintText;
  final Function(String?)? validator;
  final TextEditingController _courseName;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final int? minLine;
  final int? maxLine;
  final bool readOnly;
  final bool isNumOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: minLine,
      maxLines: maxLine,
      textInputAction: textInputAction,
      keyboardType: inputType,
      inputFormatters: isNumOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
      controller: _courseName,
      decoration: myFormFieldInputDecoration(
        icon: null,
        hintText: hintText,
      ),
      validator: (v) => validator!(v),
    );
  }
}
