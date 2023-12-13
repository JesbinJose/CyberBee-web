import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:meta/meta.dart';

part 'edit_course_event.dart';
part 'edit_course_state.dart';

class EditCourseBloc extends Bloc<EditCourseEvent, EditCourseState> {
  EditCourseBloc() : super(EditCourseInitial(course: null)) {
    on<ChangeCourse>((event, emit) {
      emit(
        EditCourseUpdated(course: event.course),
      );
    });
    on<ChangeEditType>((event, emit) {
      emit(
        UpdatedEditView(
          first: event.first,
          second: event.second,
          course: event.course,
          level: event.level,
        ),
      );
    });
  }
}
