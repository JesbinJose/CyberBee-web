import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class PartVideoAddWidget extends StatelessWidget {
  PartVideoAddWidget({super.key});
  final TextEditingController _video = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: _video,
          hintText: 'Video Link',
        ),
        const SizedBox(height: 60),
        CustomTextButton(
          onTap: () {},
          content: 'Add Video',
        ),
      ],
    );
  }
}
