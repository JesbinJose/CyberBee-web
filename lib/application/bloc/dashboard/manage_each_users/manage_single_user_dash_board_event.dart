part of 'manage_single_user_dash_board_bloc.dart';

@immutable
abstract class ManageSingleUserDashBoardEvent {}

class ChangeUser extends ManageSingleUserDashBoardEvent {
  final QueryDocumentSnapshot<Object?> user;
  ChangeUser({required this.user});
}
