import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/app/menuController/bloc/menu_bloc.dart';
import 'package:to_study/app/menuController/menu.dart';
import 'package:to_study/app/pages/getting_info/bloc/getting_info_bloc.dart';
import 'package:to_study/app/pages/getting_info/getting_info.dart';
import 'package:to_study/app/pages/searching_books/bloc/home_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ShortBloc()),
          BlocProvider(create: (_) => GettingInfoBloc()),
          BlocProvider(create: (_) => MenuBloc())
          ],
        child: MaterialApp(
            title: 'Short app for Prixz',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const Menu()));
  }
}
