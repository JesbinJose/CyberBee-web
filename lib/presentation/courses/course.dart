import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
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
            SizedBox(
              height: 200,
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot<Object?>>(
                  stream: GetAllCourseDetails.getCourses(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) return const SizedBox();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final course = snapshot.data!.docs[index];
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
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  }),
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