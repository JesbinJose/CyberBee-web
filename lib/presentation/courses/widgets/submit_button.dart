// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/application/bloc/course/edit_course/edit_course_bloc.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:cyberbee_web/core/firebase/function/courses/courses.dart';
import 'package:cyberbee_web/core/firebase_storage/upload_image.dart';
import 'package:cyberbee_web/presentation/widgets/custom_loading.dart';
import 'package:cyberbee_web/presentation/widgets/custom_text_button.dart';
import 'package:cyberbee_web/presentation/widgets/show_snakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required ValueNotifier<Uint8List?> intoImageLink,
    required this.imageLink,
    required TextEditingController courseName,
    required TextEditingController description,
    required TextEditingController amount,
    required TextEditingController discount,
    required TextEditingController introVideo,
    required this.course,
  })  : _formKey = formKey,
        _intoImageLink = intoImageLink,
        _courseName = courseName,
        _description = description,
        _amount = amount,
        _discount = discount,
        _introVideo = introVideo;

  final GlobalKey<FormState> _formKey;
  final ValueNotifier<Uint8List?> _intoImageLink;
  final String? imageLink;
  final TextEditingController _courseName;
  final TextEditingController _description;
  final TextEditingController _amount;
  final TextEditingController _discount;
  final TextEditingController _introVideo;
  final DocumentSnapshot<Object?>? course;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          if (_intoImageLink.value != null || imageLink != null) {
            showLoading(context);
            String? imageLink;
            if (_intoImageLink.value != null) {
              try {
                imageLink = await FireBaseStorage.upladCourseImage(
                  context,
                  file: _intoImageLink.value!,
                  courseId: '${_courseName.text}2',
                );
              } catch (e) {
                log(e.toString());
              }
            }
            MyCourse course = MyCourse(
              courseName: _courseName.text,
              description: _description.text,
              amount: int.parse(_amount.text),
              discount: int.parse(_discount.text),
              introVideo: _introVideo.text,
              introImageLink: imageLink ?? this.imageLink ?? '',
            );
            try {
              await GetAllCourseDetails.addCourse(
                course,
                context,
              ).then((value) {
                _courseName.dispose();
                _description.dispose();
                _amount.dispose();
                _discount.dispose();
                _intoImageLink.dispose();
                _intoImageLink.dispose();
              }).then(
                (value) => mySnakbar(
                  context,
                  '${this.course != null ? "Updated" : "Added"} the course',
                ),
              );
            } catch (_) {}
            context
                .read<EditCourseBloc>()
                .add(ChangeCourse(course: this.course));
            Navigator.pop(context);
            mySnakbar(
              context,
              this.course == null ? 'Course added' : 'Save changes',
            );
          }
        }
      },
      content: course == null ? 'Add course' : 'Save changes',
    );
  }
}
