import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_single_user_dash_board_event.dart';
part 'manage_single_user_dash_board_state.dart';

class ManageSingleUserDashBoardBloc extends Bloc<ManageSingleUserDashBoardEvent, ManageSingleUserDashBoardState> {
  ManageSingleUserDashBoardBloc() : super(ManageSingleUserDashBoardInitial()) {
    on<ManageSingleUserDashBoardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
