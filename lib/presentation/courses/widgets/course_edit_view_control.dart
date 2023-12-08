import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/edit_main_course.dart';
import 'package:cyberbee_web/presentation/courses/widgets/level_edit.dart';
import 'package:flutter/material.dart';

class CourseEditView extends StatelessWidget {
  const CourseEditView({
    super.key,
    required this.type,
    required this.courseId,
    this.isFirst = true,
  });
  final CourseEditType type;
  final String? courseId;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    if (isFirst && courseId == null) {
      return AddCourseScreen();
    }
    if (!isFirst && courseId == null) {
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
            });
      case CourseEditType.level:
        return AddLevelScreen(courseName: courseId!);
      case CourseEditType.part:
        return  Container(
          child: Center(
            child: Text('part'),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
