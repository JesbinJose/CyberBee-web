import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCourseTile extends StatelessWidget {
  const SingleCourseTile({
    super.key,
    required this.course,
  });

  final QueryDocumentSnapshot<Object?> course;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        color: secondaryColor,
      ),
      padding: const EdgeInsets.all(defaultPadding),
      margin: const EdgeInsets.all(defaultPadding),
      child: InkWell(
        onTap: () => context.read<EditCourseBloc>().add(
              ChangeCourse(course: course,),
            ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              child: Image.network(
                course['intro_image'],
                fit: BoxFit.fill,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Text(
              course.id,
            ),
          ],
        ),
      ),
    );
  }
}
