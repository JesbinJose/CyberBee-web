part of 'edit_course_bloc.dart';

abstract class EditCourseState {
  final QueryDocumentSnapshot? course;
  final CourseEditType first;
  final CourseEditType second;
  final String? levelNo;
  const EditCourseState({
    this.levelNo,
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
    super.levelNo,
    required super.course,
    required super.first,
    required super.second,
  });
}
