import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_control_event.dart';
part 'drawer_control_state.dart';

class DrawerControlBloc extends Bloc<DrawerControlEvent, DrawerControlState> {
  DrawerControlBloc() : super(DrawerControlInitial(screenIndex: 0)) {
    on<ChangeScreen>((event, emit) {
      emit(
        DrawerControlUpdated(
          screenIndex: event.screenIndex,
        ),
      );
    });
  }
}
