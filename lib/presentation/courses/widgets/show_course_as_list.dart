import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/add_level_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCourseAsList extends StatelessWidget {
  const ShowCourseAsList({
    super.key,
    required this.courseName,
    required this.course,
    required this.levelName,
    required this.levelNo,
  });

  final String courseName;
  final QueryDocumentSnapshot<Object?> course;
  final TextEditingController levelName;
  final TextEditingController levelNo;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: GetAllCourseDetails.getAllLevels(courseName),
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10,),
              child: Text("Course - $courseName"),
            ),
            if (snapshot.data != null)
              ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final level = snapshot.data!.docs[index];
                  return InkWell(
                    onTap: () => context.read<EditCourseBloc>().add(
                          ChangeEditType(
                            first: CourseEditType.level,
                            second: CourseEditType.part,
                            course: course,
                            levelNo: level.id,
                          ),
                        ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      margin: const EdgeInsets.all(4),
                      width: double.infinity,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          level['level_name'],
                        ),
                      ),
                    ),
                  );
                },
              ),
            AddLevelWidget(
              levelName: levelName,
              levelNo: levelNo,
              courseName: courseName,
            ),
          ],
        );
      },
    );
  }
}
