part of 'edit_course_bloc.dart';

@immutable
abstract class EditCourseEvent {}

class ChangeCourse extends EditCourseEvent {
  final QueryDocumentSnapshot course;
  ChangeCourse({required this.course});
}

class ChangeEditType extends EditCourseEvent {
  final CourseEditType first;
  final CourseEditType second;
  final QueryDocumentSnapshot course;
  final String? levelNo;
  ChangeEditType({
    this.levelNo,
    required this.course,
    required this.first,
    required this.second,
  });
}
