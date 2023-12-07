part of 'edit_course_bloc.dart';

abstract class EditCourseState {
  final QueryDocumentSnapshot? course;
  const EditCourseState({required this.course});
}

final class EditCourseInitial extends EditCourseState {
  EditCourseInitial({required super.course});
}

final class EditCourseUpdated extends EditCourseState {
  EditCourseUpdated({required super.course});
}
