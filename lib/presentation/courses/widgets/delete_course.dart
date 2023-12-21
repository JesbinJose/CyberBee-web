
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCoursePart extends StatelessWidget {
  const DeleteCoursePart({
    super.key,
    required this.course,
  });

  final DocumentSnapshot<Object?>? course;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 300,
          child: Text(
            'By deleting the course the all the data can\'t be recovered',
          ),
        ),
        IconButton(
          onPressed: () async {
            GetAllCourseDetails.deleteCourse(
              course!.id,
            );
            context.read<EditCourseBloc>().add(
                  ChangeCourse(course: null),
                );
          },
          icon: const Icon(
            CupertinoIcons.delete,
          ),
        ),
      ],
    );
  }
}
