part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
    final Model model;
   const MenuState( this.model);
  
  @override
  List<Object> get props => [model];
}

class MenuInitial extends MenuState {
 const MenuInitial(Model model) : super(model);
}

class MenuChangedState extends MenuState {
 const MenuChangedState(Model model) : super(model);

}
class Model extends Equatable {
  final int? pageSelected;


  const Model(
      {this.pageSelected = 0,
});

  Model copyWith(
          {int? pageSelected,
 }) =>
      Model(
        pageSelected: pageSelected,

      );

  @override
  List<Object?> get props => [pageSelected];
}