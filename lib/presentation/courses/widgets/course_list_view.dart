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
    final ScrollController controller = ScrollController(
      initialScrollOffset: -1000,
    );
    return SizedBox(
      height: 200,
      child: StreamBuilder<QuerySnapshot<Object?>>(
        stream: GetAllCourseDetails.getCourses(),
        builder: (context, snapshot) {
          if (snapshot.data == null) return const SizedBox();
          return ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final course = snapshot.data!.docs[index];
              return SingleCourseTile(
                course: course,
              );
            },
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
