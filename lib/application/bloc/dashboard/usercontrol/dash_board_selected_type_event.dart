part of 'dash_board_selected_type_bloc.dart';

@immutable
abstract class DashBoardSelectedTypeEvent {}

class ChangeType extends DashBoardSelectedTypeEvent {
  ChangeType({required this.userType});
  final UserType userType;
}
