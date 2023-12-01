part of 'drawer_control_bloc.dart';

@immutable
abstract class DrawerControlEvent {}

class ChangeScreen extends DrawerControlEvent {
  final int screenIndex;
  ChangeScreen({required this.screenIndex});
}
