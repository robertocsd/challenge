import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/app/pages/getting_info/bloc/getting_info_bloc.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = BlocProvider.of<GettingInfoBloc>(context);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(body: BlocBuilder<GettingInfoBloc, GettingInfoState>(
      builder: (context, state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.05),
              const Text('Tu información es:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              SizedBox(height: height * 0.05),
              Text('Nombre: ${state.model.firstName}',style: const TextStyle(fontSize: 20)),
              SizedBox(height: height * 0.02),
              Text('Apellido: ${state.model.lastNames}',style: const TextStyle(fontSize: 20)),
               SizedBox(height: height * 0.02),
              Text('Edad: ${state.model.age}',style: const TextStyle(fontSize: 20)),
               SizedBox(height: height * 0.02),
              Text('Sexo: ${state.model.sexo}',style: const TextStyle(fontSize: 20)),
               SizedBox(height: height * 0.02),
              Text('Celular: ${state.model.phoneNumber}',style: const TextStyle(fontSize: 20)),
               SizedBox(height: height * 0.02),
              Text('Correo: ${state.model.email}',style: const TextStyle(fontSize: 20)),
              
              
              ],
          ),
        );
      },
    ));
  }
}