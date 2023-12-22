import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';
import 'package:flutter/material.dart';

class GetAllCourseDetails {
  static final CollectionReference _instance =
      FirebaseFirestore.instance.collection('courses');

  static Stream<QuerySnapshot> getRecomaendedCourse() {
    return _instance.snapshots();
  }

  static Stream<QuerySnapshot<Object?>> getCourses() {
    return _instance.snapshots();
  }

  static Stream<DocumentSnapshot<Object?>> getCourseDetails(String courseId) {
    return _instance.doc(courseId).snapshots();
  }

  static Future<QueryDocumentSnapshot<Object?>> getACourse() async {
    return (await _instance.get()).docs[2];
  }

  static Future<void> addCourse(
    MyCourse course,
    BuildContext context,
  ) async {
    Map<String, dynamic> data = {
      'description': course.description,
      'amount': course.amount,
      'discount': course.discount,
      'intro_video': course.introVideo,
      'intro_image': course.introImageLink,
      'levels_number': course.levelsNumber,
    };
    try {
      _instance.doc(course.courseName).set(data);
    } catch (e) {
      throw e.toString();
    }
  }

  static Stream<QuerySnapshot> getAllLevels(String courseName) {
    return _instance.doc(courseName).collection('levels').snapshots();
  }

  static Future<void> addLevel(MyLevel level) async {
    await _instance
        .doc(level.courseName)
        .collection('levels')
        .doc(level.levelNumber)
        .set({'level_name': level.levelName});
  }

  static Stream<QuerySnapshot> getAllParts(String courseName, String levelNo) {
    return _instance
        .doc(courseName)
        .collection('levels')
        .doc(levelNo)
        .collection('parts')
        .snapshots();
  }

  static Future<void> addPartsVideo({
    required String courseName,
    required String levelNo,
    required VideoPart videoPart,
  }) async {
    await _instance
        .doc(courseName)
        .collection('levels')
        .doc(levelNo)
        .collection('parts')
        .doc(videoPart.partNo)
        .set({
      'type': 'video',
      'partName': videoPart.partName,
      'description': videoPart.description,
      'url': videoPart.videoUrl,
    });
  }

  static Future<void> addPartsPdf({
    required String courseName,
    required String levelNo,
    required PDFPart pdfPart,
  }) async {
    await _instance
        .doc(courseName)
        .collection('levels')
        .doc(levelNo)
        .collection('parts')
        .doc(pdfPart.partNo)
        .set({
      'type': 'pdf',
      'partName': pdfPart.partName,
      'description': pdfPart.description,
      'url': pdfPart.pdfUrl,
    });
  }

  static Future<void> addPartsQuiz({
    required String courseName,
    required String levelName,
    required Quiz quizPart,
  }) async {}

  static Future<void> deleteCourse(String courseName) async {
    await _instance.doc(courseName).delete();
  }
}
