import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLevelWidget extends StatelessWidget {
  const AddLevelWidget({
    super.key,
    required this.levelName,
    required this.levelNo,
    required this.courseName,
    required this.isEdit,
    required this.course,
  });

  final DocumentSnapshot course;
  final TextEditingController levelName;
  final TextEditingController levelNo;
  final String courseName;
  final bool isEdit;

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
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Level Name is required';
              }
              return null;
            },
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          CustomTextFormField(
            controller: levelNo,
            hintText: 'Level Number',
            isNumOnly: true,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Level Number is required';
              }
              return null;
            },
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
              context.read<EditCourseBloc>().add(
                    ChangeEditType(
                      first: CourseEditType.level,
                      second: CourseEditType.part,
                      course: course,
                      level: null,
                    ),
                  );
              GetAllCourseDetails.addLevel(level);
            },
            content: isEdit ? 'Save' : 'Add Level',
          ),
        ],
      ),
    );
  }
}
