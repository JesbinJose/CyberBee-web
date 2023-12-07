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
  ChangeEditType({
    required this.first,
    required this.second,
  });
}
