part of 'drawer_control_bloc.dart';

sealed class DrawerControlState {
  final int screenIndex;
  DrawerControlState({required this.screenIndex});
}

final class DrawerControlInitial extends DrawerControlState {
  DrawerControlInitial({required super.screenIndex});
}

final class DrawerControlUpdated extends DrawerControlState {
  DrawerControlUpdated({required super.screenIndex});
}
