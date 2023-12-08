import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class PartExamAddWidget extends StatelessWidget {
  const PartExamAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        CustomTextButton(
          onTap: () {},
          content: 'Add Question',
        ),
      ],
    );
  }
}
