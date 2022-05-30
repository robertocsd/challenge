part of 'menu_bloc.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class OnChangePage extends MenuEvent {
  final int pageSelected;

  const OnChangePage(this.pageSelected);
}
