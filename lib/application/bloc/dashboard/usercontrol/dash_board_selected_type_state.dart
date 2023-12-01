part of 'dash_board_selected_type_bloc.dart';

abstract class DashBoardSelectedTypeState {
  final UserType userType;

  DashBoardSelectedTypeState({required this.userType});
}

class DashBoardSelectedTypeInitial extends DashBoardSelectedTypeState {
  DashBoardSelectedTypeInitial({required super.userType});
}
class DashBoardSelectedTypeUpdated extends DashBoardSelectedTypeState {
  DashBoardSelectedTypeUpdated({required super.userType});
}
