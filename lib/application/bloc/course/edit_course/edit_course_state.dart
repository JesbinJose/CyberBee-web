part of 'edit_course_bloc.dart';

abstract class EditCourseState {
  final DocumentSnapshot? course;
  final CourseEditType first;
  final CourseEditType second;
  final QueryDocumentSnapshot? level;
  const EditCourseState({
    this.level,
    this.course,
    this.first = CourseEditType.course,
    this.second = CourseEditType.level,
  });
}

final class EditCourseInitial extends EditCourseState {
  EditCourseInitial({required super.course});
}

final class EditCourseUpdated extends EditCourseState {
  EditCourseUpdated({required super.course});
}

final class UpdatedEditView extends EditCourseState {
  UpdatedEditView({
    super.level,
    required super.course,
    required super.first,
    required super.second,
  });
}
