import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class PartPdfAddWidget extends StatelessWidget {
  PartPdfAddWidget({super.key});

  final TextEditingController _pdf = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: _pdf,
          hintText: 'Pdf Link',
        ),
        const SizedBox(height: 60,),
        CustomTextButton(
          onTap: () {},
          content: 'Add PDF',
        ),
      ],
    );
  }
}
