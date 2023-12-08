import 'dart:typed_data';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/core/firebase_storage/upload_image.dart';
import 'package:cyberbee_web/presentation/courses/widgets/pick_image_control.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:cyberbee_web/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';

class AddCourseScreen extends StatelessWidget {
  AddCourseScreen({super.key});
  final TextEditingController _courseName = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _discount = TextEditingController();
  final TextEditingController _introVideo = TextEditingController();
  final ValueNotifier<Uint8List?> _intoImageLink =
      ValueNotifier<Uint8List?>(null);
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
              const SizedBox(height: 30),
              CustomTextFormField(
                courseName: _courseName,
                hintText: 'Course Name',
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                courseName: _description,
                hintText: 'Description',
                minLine: 5,
                maxLine: null,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                courseName: _amount,
                hintText: 'Amount',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                courseName: _discount,
                hintText: 'Discount',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                courseName: _introVideo,
                hintText: 'Intro Video Link',
              ),
              const SizedBox(height: 20),
              PickImageControl(intoImageLink: _intoImageLink),
              const SizedBox(height: 30),
              CustomTextButton(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (_intoImageLink.value != null) {
                      final String? imageLink =
                          await FireBaseStorage.upladCourseImage(
                        context,
                        file: _intoImageLink.value!,
                        courseId: _courseName.text,
                      );
                      MyCourse course = MyCourse(
                        courseName: _courseName.text,
                        description: _description.text,
                        amount: int.parse(_amount.text),
                        discount: int.parse(_discount.text),
                        introVideo: _introVideo.text,
                        introImageLink: imageLink ?? '',
                      );
                      await GetAllCourseDetails.addCourse(course).then(
                        (_) => mySnakbar(
                          context,
                          'Course added',
                        ),
                      );
                    }
                  }
                },
                content: 'Add course',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
