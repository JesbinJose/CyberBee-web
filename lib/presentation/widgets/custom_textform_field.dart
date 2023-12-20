import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.textInputAction,
    this.minLine,
    this.maxLine = 1,
    this.readOnly= false,
  }) : _courseName = controller;

  final String hintText;
  final TextEditingController _courseName;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final int? minLine;
  final int? maxLine;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: minLine,
      maxLines: maxLine,
      textInputAction: textInputAction,
      keyboardType: inputType,
      controller: _courseName,
      decoration: myFormFieldInputDecoration(
        icon: null,
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'this field is empty';
        }
        return null;
      },
    );
  }
}
