import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';

class AddLevelScreen extends StatelessWidget {
  final String courseName;
  AddLevelScreen({
    super.key,
    required this.courseName,
  });
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
            if (snapshot.data == null ) {
              return AddLevelWidget(
                levelName: levelName,
                levelNo: levelNo,
              );
            }
            return Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final level = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {},
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
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AddLevelWidget extends StatelessWidget {
  const AddLevelWidget({
    super.key,
    required this.levelName,
    required this.levelNo,
  });

  final TextEditingController levelName;
  final TextEditingController levelNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        children: [
          CustomTextFormField(
            controller: levelName,
            hintText: 'Level Name',
          ),
          const SizedBox(height:defaultPadding,),
          CustomTextFormField(
            controller: levelNo,
            hintText: 'Level Number',
          ),
          const SizedBox(height:defaultPadding,),
          CustomTextButton(
            onTap: () {},
            content: 'Add Level',
          ),
        ],
      ),
    );
  }
}
