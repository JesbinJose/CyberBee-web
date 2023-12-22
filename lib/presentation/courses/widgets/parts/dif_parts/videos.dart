import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class PartVideoAddWidget extends StatelessWidget {
  PartVideoAddWidget({
    super.key,
    required this.partName,
    required this.descripition,
    required this.partNo,
    required this.courseName,
    required this.levelName,
  });
  final TextEditingController _video = TextEditingController();
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
          controller: _video,
          hintText: 'Video Link',
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Video Link is required';
            } else if (!RegExp(ytlinkVal).hasMatch(v)) {
              return 'Invalid link';
            }
            return null;
          },
        ),
        const SizedBox(height: 60),
        CustomTextButton(
          onTap: () async {
            final VideoPart videoPart = VideoPart(
              videoUrl: _video.text,
              description: descripition.text,
              partName: partName.text,
              partNo: partNo.text,
            );
            await GetAllCourseDetails.addPartsVideo(
              courseName: courseName,
              levelNo: levelName,
              videoPart: videoPart,
            );
          },
          content: 'Add Video',
        ),
      ],
    );
  }
}
