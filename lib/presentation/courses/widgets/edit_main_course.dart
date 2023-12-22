// ignore_for_file: use_build_context_synchronously
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/presentation/courses/widgets/delete_course.dart';
import 'package:cyberbee_web/presentation/courses/widgets/pick_image_control.dart';
import 'package:cyberbee_web/presentation/courses/widgets/submit_button.dart';
import 'package:cyberbee_web/presentation/widgets/custom_textform_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              const SizedBox(height: 20),
              if (course != null) DeleteCoursePart(course: course),
              const SizedBox(height: 30),
              CustomTextFormField(
                readOnly: course != null,
                controller: _courseName,
                hintText: 'Course Name',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Course Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _description,
                hintText: 'Description',
                minLine: 5,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
                maxLine: null,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _amount,
                hintText: 'Amount',
                inputType: TextInputType.number,
                isNumOnly: true,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Amount is required';
                  }
                  final value = int.parse(v);
                  if (value < 0) {
                    return 'Amount must be greater than 1';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                isNumOnly: true,
                controller: _discount,
                hintText: 'Discount',
                inputType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Discount is required';
                  }
                  final value = int.parse(v);
                  if (value < -1 || value > 101) {
                    return 'Write the discount in percentage';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                controller: _introVideo,
                hintText: 'Intro Video Link',
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Video Link is required';
                  } else if (!RegExp(ytlinkVal).hasMatch(v)) {
                    return 'Invalid link';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              PickImageControl(
                intoImageLink: _intoImageLink,
                urlImageLink: imageLink,
              ),
              const SizedBox(height: 10),
              SubmitButton(
                formKey: _formKey,
                intoImageLink: _intoImageLink,
                imageLink: imageLink,
                courseName: _courseName,
                description: _description,
                amount: _amount,
                discount: _discount,
                introVideo: _introVideo,
                course: course,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
