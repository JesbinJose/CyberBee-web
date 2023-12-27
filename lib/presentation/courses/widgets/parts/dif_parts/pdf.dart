import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class PartPdfAddWidget extends StatelessWidget {
  PartPdfAddWidget({
    super.key,
    required this.partName,
    required this.descripition,
    required this.partNo,
    required this.courseName,
    required this.levelName,
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
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Pdf Link is required';
            }
            if (!v.contains('docs.google.com/document')) {
              return 'Not Valid Link Provided';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 60,
        ),
        CustomTextButton(
          onTap: () async {
            final PDFPart part = PDFPart(
              pdfUrl: _pdf.text,
              partName: partName.text,
              description: descripition.text,
              partNo: partNo.text,
            );
            await GetAllCourseDetails.addPartsPdf(
              courseName: courseName,
              levelNo: levelName,
              pdfPart: part,
            );
          },
          content: 'Add PDF',
        ),
      ],
    );
  }
}
