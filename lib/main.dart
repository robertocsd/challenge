import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/bloc/bloc/short_bloc.dart';
import 'package:to_study/pages/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ShortBloc())],
        child: MaterialApp(
            title: 'Short App Test NuBank',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MoviePage()));
  }
}
