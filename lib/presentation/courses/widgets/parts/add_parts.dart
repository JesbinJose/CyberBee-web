import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/courses/widgets/parts/add_part_with_details.dart';
import 'package:flutter/material.dart';

class AddPartsScreen extends StatelessWidget {
  AddPartsScreen({
    super.key,
    required this.courseName,
    required this.levelNo,
  });
  final String courseName;
  final String levelNo;
  final ValueNotifier<QueryDocumentSnapshot?> partNotifier =
      ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: GetAllCourseDetails.getAllParts(courseName, levelNo),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text("Level - $levelNo"),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final part = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () => partNotifier.value = part,
                      child: Container(
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
                            part['partName'],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: 450,
                  margin: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: AddPartToLevelInputScreen(
                    part: partNotifier.value,
                    course: courseName,
                    levelNo: levelNo,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
