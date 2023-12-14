import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/core/firebase_storage/upload_image.dart';
import 'package:cyberbee_web/presentation/courses/widgets/pick_image_control.dart';
import 'package:cyberbee_web/presentation/widgets/custom_loading.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddCourseScreen extends StatelessWidget {
  AddCourseScreen({super.key, this.course}) {
    _courseName = TextEditingController(text: course?.id);
    _description = TextEditingController(text: course?['description']);
    _amount = TextEditingController(text: "${course?['amount'] ?? ''}");
    _discount = TextEditingController(text: "${course?['discount'] ?? ''}");
    _introVideo = TextEditingController(text: course?['intro_video']);
    _intoImageLink = ValueNotifier<Uint8List?>(null);
    imageLink = course?['intro_image'];
  }
  late String? imageLink;
  late DocumentSnapshot<Object?>? course;
  late TextEditingController _courseName;
  late TextEditingController _description;
  late TextEditingController _amount;
  late TextEditingController _discount;
  late TextEditingController _introVideo;
  late ValueNotifier<Uint8List?> _intoImageLink;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (course != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () async {
                      await GetAllCourseDetails.deleteCourse(
                        course!.id,
                      );
                      await GetAllCourseDetails.getACourse().then(
                        (value) => context.read<EditCourseBloc>().add(
                              ChangeEditType(
                                course: value,
                                first: CourseEditType.course,
                                second: CourseEditType.level,
                              ),
                            ),
                      );
                    },
                    icon: const Icon(
                      CupertinoIcons.delete,
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              CustomTextFormField(
                controller: _courseName,
                hintText: 'Course Name',
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _description,
                hintText: 'Description',
                minLine: 5,
                maxLine: null,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _amount,
                hintText: 'Amount',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _discount,
                hintText: 'Discount',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _introVideo,
                hintText: 'Intro Video Link',
              ),
              const SizedBox(height: 20),
              PickImageControl(
                intoImageLink: _intoImageLink,
                urlImageLink: imageLink,
              ),
              const SizedBox(height: 30),
              CustomTextButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_intoImageLink.value != null || imageLink != null) {
                      showLoading(context);
                      String? imageLink;
                      if (_intoImageLink.value != null) {
                        imageLink = await FireBaseStorage.upladCourseImage(
                          context,
                          file: _intoImageLink.value!,
                          courseId: _courseName.text,
                        );
                      }
                      MyCourse course = MyCourse(
                        courseName: _courseName.text,
                        description: _description.text,
                        amount: int.parse(_amount.text),
                        discount: int.parse(_discount.text),
                        introVideo: _introVideo.text,
                        introImageLink: imageLink ?? this.imageLink!,
                      );
                      await GetAllCourseDetails.addCourse(
                              course, this.course?.id)
                          .then(
                        (_) => Navigator.pop(context),
                      );
                    }
                  }
                },
                content: course == null ? 'Add course' : 'Save changes',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
