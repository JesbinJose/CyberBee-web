import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class AddLevelWidget extends StatelessWidget {
  const AddLevelWidget({
    super.key,
    required this.levelName,
    required this.levelNo,
    required this.courseName,
  });

  final TextEditingController levelName;
  final TextEditingController levelNo;
  final String courseName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        children: [
          CustomTextFormField(
            controller: levelName,
            hintText: 'Level Name',
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          CustomTextFormField(
            controller: levelNo,
            hintText: 'Level Number',
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          CustomTextButton(
            onTap: () async {
              final MyLevel level = MyLevel(
                levelNumber: levelNo.text,
                levelName: levelName.text,
                courseName: courseName,
              );
              levelName.text = "";
              levelNo.text = "";
              GetAllCourseDetails.addLevel(level);
            },
            content: 'Add Level',
          ),
        ],
      ),
    );
  }
}
