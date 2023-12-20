import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/single_course_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              if (index == 0) {
                return const AddCourseWidget();
              }
              final course = snapshot.data!.docs[index - 1];
              return SingleCourseTile(
                course: course,
              );
            },
            itemCount: snapshot.data!.docs.length + 1,
          );
        },
      ),
    );
  }
}

class AddCourseWidget extends StatelessWidget {
  const AddCourseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<EditCourseBloc>().add(
            ChangeCourse(course: null),
          ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          color: secondaryColor,
        ),
        margin: const EdgeInsets.all(defaultPadding),
        padding: const EdgeInsets.all(2 * defaultPadding),
        child: Center(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white24,
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
