import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/edit_main_course.dart';
import 'package:cyberbee_web/presentation/courses/widgets/level_edit.dart';
import 'package:cyberbee_web/presentation/courses/widgets/parts/add_parts.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CourseEditView extends StatelessWidget {
  CourseEditView({
    super.key,
    required this.type,
    this.isFirst = true,
    required this.course,
    this.level,
  }) {
    courseId = course?.id;
    levelNo = level?.id;
  }
  final QueryDocumentSnapshot<Object?>? course;
  final QueryDocumentSnapshot<Object?>? level;
  final CourseEditType type;
  late String? courseId;
  final bool isFirst;
  late String? levelNo;

  @override
  Widget build(BuildContext context) {
    if (courseId == null && type == CourseEditType.course && isFirst) {
      return AddCourseScreen();
    } else if (courseId == null && !isFirst) {
      return const SizedBox();
    }
    switch (type) {
      case CourseEditType.course:
        return StreamBuilder(
          stream: GetAllCourseDetails.getCourseDetails(courseId!),
          builder: (context, snapshot) {
            return AddCourseScreen(
              course: snapshot.data,
            );
          },
        );
      case CourseEditType.level:
        return AddLevelScreen(
          course: course!,
          level: level,
        );
      case CourseEditType.part:
        return AddPartsScreen(
          courseName: courseId!,
          levelNo: levelNo ?? '01',
        );
      default:
        return const SizedBox();
    }
  }
}
