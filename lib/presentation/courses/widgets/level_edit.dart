import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/presentation/courses/widgets/show_course_as_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddLevelScreen extends StatelessWidget {
  late String courseName;
  final QueryDocumentSnapshot<Object?> course;
  AddLevelScreen({
    super.key,
    required this.course,
  }) {
    courseName = course.id;
  }
  final TextEditingController levelName = TextEditingController();
  final TextEditingController levelNo = TextEditingController();

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
        ),
      ),
    );
  }
}

