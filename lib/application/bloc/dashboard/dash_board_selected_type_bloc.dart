import 'package:bloc/bloc.dart';
import 'package:cyberbee_web/constants.dart';
import 'package:meta/meta.dart';

part 'dash_board_selected_type_event.dart';
part 'dash_board_selected_type_state.dart';

class DashBoardSelectedTypeBloc
    extends Bloc<DashBoardSelectedTypeEvent, DashBoardSelectedTypeState> {
  DashBoardSelectedTypeBloc()
      : super(DashBoardSelectedTypeInitial(userType: UserType.student)) {
    on<ChangeType>((event, emit) {
      emit(
        DashBoardSelectedTypeUpdated(
          userType: event.userType,
        ),
      );
    });
  }
}
