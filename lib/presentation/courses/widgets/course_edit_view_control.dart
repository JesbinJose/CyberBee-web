import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/courses/widgets/edit_main_course.dart';
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
    switch (type) {
      case CourseEditType.course:
        return Container(
          child: Center(
            child: Text(courseId!),
          ),
        );
      case CourseEditType.level:
        return Container(
          child: Center(
            child: Text('level'),
          ),
        );
      case CourseEditType.part:
        return Container(
          child: Center(
            child: Text('part'),
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
