import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/single_course_tile.dart';
import 'package:flutter/material.dart';

class CourseListView extends StatelessWidget {
  const CourseListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: StreamBuilder<QuerySnapshot<Object?>>(
        stream: GetAllCourseDetails.getCourses(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final course = snapshot.data!.docs[index];
              return SingleCourseTile(course: course);
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}

