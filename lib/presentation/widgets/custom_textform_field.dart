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
    this.readOnly = false,
     this.validator,
    this.onChanged,
  }) : _courseName = controller;

  final String hintText;
  final Function(String?)? validator;
  final Function(String?)? onChanged;
  final TextEditingController _courseName;
  final TextInputType inputType;
  final TextInputAction? textInputAction;
  final int? minLine;
  final int? maxLine;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
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
      validator: (v) => validator!(v),
    );
  }
}
