import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class AddPartsScreen extends StatelessWidget {
  const AddPartsScreen({
    super.key,
    required this.courseName,
    required this.levelNo,
  });
  final String courseName;
  final String levelNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: StreamBuilder(
        stream: GetAllCourseDetails.getAllParts(courseName, levelNo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          return Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final part = snapshot.data!.docs[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.all(4),
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        part['part_name'],
                      ),
                    ),
                  );
                },
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => AddPartToLevelInputScreen(
                  //       course: courseName,
                  //       levelNo: levelNo,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(4),
                  height: 100,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: CustomTextButton(onTap: () {}, content: '',),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
