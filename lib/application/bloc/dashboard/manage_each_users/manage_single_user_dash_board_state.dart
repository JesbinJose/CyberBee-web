part of 'manage_single_user_dash_board_bloc.dart';

sealed class ManageSingleUserDashBoardState {
  final QueryDocumentSnapshot<Object?>? user;
  ManageSingleUserDashBoardState({required this.user});
}

final class ManageSingleUserDashBoardInitial
    extends ManageSingleUserDashBoardState {
  ManageSingleUserDashBoardInitial({required super.user});
}
final class ManageSingleUserDashBoardUpdated
    extends ManageSingleUserDashBoardState {
  ManageSingleUserDashBoardUpdated({required super.user});
}

