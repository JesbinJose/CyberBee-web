import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/add_level_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddLevelScreen extends StatelessWidget {
  late String courseName;
  final QueryDocumentSnapshot<Object?> course;
  AddLevelScreen({
    super.key,
    required this.course,
  }) {
    courseName = course.id;
  }
  final TextEditingController levelName = TextEditingController();
  final TextEditingController levelNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: GetAllCourseDetails.getAllLevels(courseName),
          builder: (context, snapshot) {
            return Column(
              children: [
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
                                  course: course),
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
        ),
      ),
    );
  }
}
