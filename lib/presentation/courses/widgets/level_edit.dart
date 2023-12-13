import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/presentation/courses/widgets/show_course_as_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddLevelScreen extends StatelessWidget {
  late String courseName;
  final QueryDocumentSnapshot<Object?> course;
  final QueryDocumentSnapshot<Object?>? level;
  late TextEditingController levelName;
  late TextEditingController levelNo;
  AddLevelScreen({
    super.key,
    required this.course,
    required this.level,
  }) {
    courseName = course.id;
    levelName = TextEditingController(text: level?['level_name']);
    levelNo = TextEditingController(text: level?.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: ShowCourseAsList(
          courseName: courseName,
          course: course,
          levelName: levelName,
          levelNo: levelNo,
          isEdit: level != null,
        ),
      ),
    );
  }
}
