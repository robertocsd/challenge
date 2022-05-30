import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuInitial(Model(pageSelected: 0))) {

    on<OnChangePage>((event, emit) {
      emit(MenuChangedState(state.model.copyWith(pageSelected: event.pageSelected)));

    });
  }
}
