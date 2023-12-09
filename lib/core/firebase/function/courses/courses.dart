import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/core/firebase/function/courses/course_models.dart';

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

  static Future<void> addCourse(MyCourse course) async {
    Map<String, dynamic> data = {
      'description': course.description,
      'amount': course.amount,
      'discount': course.discount,
      'intro_video': course.introVideo,
      'intro_image': course.introImageLink,
      'levels_number': course.levelsNumber,
    };
    _instance.doc(course.courseName).set(data);
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
    required String levelName,
    required VideoPart videoPart,
  }) async {}

  static Future<void> addPartsPdf({
    required String courseName,
    required String levelName,
    required PDFPart pdfPart,
  }) async {}

  static Future<void> addPartsQuiz({
    required String courseName,
    required String levelName,
    required Quiz quizPart,
  }) async {}
}
