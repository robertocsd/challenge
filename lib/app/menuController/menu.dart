import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/app/menuController/bloc/menu_bloc.dart';

import 'package:to_study/app/menuController/widgets/nav_bar.dart';
import 'package:to_study/app/pages/getting_info/getting_info.dart';
import 'package:to_study/app/pages/searching_books/searching_books.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}
//Genesis principal fork origin route

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<MenuBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return Stack(
            children: [
              _navigationControl(state.model.pageSelected!),
              NavBarCustom(
                children: [
                  NavBarCustomChildren(
                      path: "assets/user.svg",
                      color: state.model.pageSelected == 0
                          ? Colors.orange
                          : Colors.grey,
                      onTap: () => bloc.add(const OnChangePage(0))),
                  NavBarCustomChildren(
                    path: "assets/open-book.svg",
                    color: state.model.pageSelected == 1
                        ? Colors.orange
                        : Colors.grey,
                    onTap: () => bloc.add(const OnChangePage(1)),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget _navigationControl(int index) {
    switch (index) {
      case 0:
        return const GettingInfoPage();

      case 1:
        return  const HomePage();

      default:
        return const HomePage();
    }
  }
}
