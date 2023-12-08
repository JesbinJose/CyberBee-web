import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class PartPdfAddWidget extends StatelessWidget {
  PartPdfAddWidget({
    super.key,
    required this.partName,
    required this.descripition,
    required this.partNo, required this.courseName, required this.levelName,
  });

  final TextEditingController _pdf = TextEditingController();
  final TextEditingController partName;
  final TextEditingController descripition;
  final TextEditingController partNo;
    final String courseName;
  final String levelName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: _pdf,
          hintText: 'Pdf Link',
        ),
        const SizedBox(
          height: 60,
        ),
        CustomTextButton(
          onTap: () {},
          content: 'Add PDF',
        ),
      ],
    );
  }
}
