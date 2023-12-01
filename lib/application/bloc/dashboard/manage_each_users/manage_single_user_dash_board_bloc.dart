import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'manage_single_user_dash_board_event.dart';
part 'manage_single_user_dash_board_state.dart';

class ManageSingleUserDashBoardBloc extends Bloc<ManageSingleUserDashBoardEvent,
    ManageSingleUserDashBoardState> {
  ManageSingleUserDashBoardBloc()
      : super(ManageSingleUserDashBoardInitial(user: null)) {
    on<ChangeUser>((event, emit) {
      emit(
        ManageSingleUserDashBoardUpdated(user: event.user),
      );
    });
  }
}
