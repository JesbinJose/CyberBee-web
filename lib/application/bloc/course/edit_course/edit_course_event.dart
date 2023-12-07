part of 'edit_course_bloc.dart';

@immutable
abstract class EditCourseEvent {}

class ChangeCourse extends EditCourseEvent {
  final QueryDocumentSnapshot course;
  ChangeCourse({required this.course});
}
