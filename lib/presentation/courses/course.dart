import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/courses/widgets/course_list_view.dart';
import 'package:cyberbee_web/presentation/courses/widgets/edit_course_full.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            CourseListView(),
            SizedBox(height: defaultPadding),
            EditCourseWidget(),
          ],
        ),
      ),
    );
  }
}

