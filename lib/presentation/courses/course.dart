import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/courses/widgets/course_list_view.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: CourseListView(),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

