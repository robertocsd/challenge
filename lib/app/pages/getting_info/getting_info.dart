import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_study/app/pages/getting_info/bloc/getting_info_bloc.dart';
import 'package:to_study/app/pages/getting_info/childrens/show_info.dart';
import 'package:to_study/app/pages/searching_books/widgets/inputs/generic_input.dart';

class GettingInfoPage extends StatelessWidget {
  const GettingInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
        final bloc = BlocProvider.of<GettingInfoBloc>(context);

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GettingInfoBloc, GettingInfoState>(
          builder: (context, state) {
            return Column(
              children: [
                const Text(
                  'Por favor escribe tus datos personales',
                ),
                SizedBox(height: height * 0.05),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.1,
                    child: GenerinInputWidget(

                      keyboardType: 'text',
                      onWrite: (data) {
                        // blocHome.add(OnGettingShortURL(data));
                        bloc.add(GettingNameEvent(data));
                      },
                      hintText: 'Escribe tu nombre aqui',
                      onError: state.model.firstNameError! ? 'Escribe tu nombre' : null,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.1,
                    child: GenerinInputWidget(
                      keyboardType: 'text',
                      onWrite: (data) {
                        // blocHome.add(OnGettingShortURL(data));
                        bloc.add(GettingLastName(data));
                      },
                      hintText: 'Escribe tu apellido aqui',
                      onError: state.model.lastNameError! ? 'Tu apellido no puede estar vacio' : null,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.1,
                    child: GenerinInputWidget(
                      keyboardType: 'number',
                      onWrite: (data) {
                        // blocHome.add(OnGettingShortURL(data));
                            bloc.add(GettingPhone(data));
                      },
                      hintText: 'Escribe tu teléfono aqui',
                      onError:state.model.phoneNumberError! ? 'Tu telefono no puede estar vacío' : null,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.1,
                    child: GenerinInputWidget(
                      keyboardType: 'email',
                      onWrite: (data) {
                        // blocHome.add(OnGettingShortURL(data));
                        bloc.add(GettingEmailEvent(data));
                      },
                      hintText: 'Escribe tu email aqui',
                      onError:  state.model.emailError! ? 'Tu email no es valido' : null,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.1,
                    child: CupertinoButton(child: const Text('Elige tu fecha de nacimiento'), onPressed: () {
                       showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return CalendarDatePicker(
                              initialDate: state.model.bornDate!,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(3000),
                              onDateChanged: (e) {
                               bloc.add(GettingDateEvent(e));
                        
                        });
                    });

                     
    
  

                    })),
                    Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: width * 0.8,
                    height: height * 0.1,
                    child: Text(state.model.bornDateError! ? 'Debes tener por lo menos 15 años para usar esta aplicación' : state.model.bornDate!.toString())),

                    Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Cuál es tu sexo?'),
              RadioListTile(
                  title: const Text('Masculino'),
                  value: 'Masculino',
                  groupValue: state.model.sexo,
                  selected: true,
                  toggleable: true,
                  onChanged: (value) {
                      bloc.add(GettingSexoEvent(value.toString()));

              
                  }),
              RadioListTile(
                  title: const Text('Femenino'),
                  value: 'Femenino',
                  groupValue: state.model.sexo,
                  onChanged: (value) {
               
                    bloc.add(GettingSexoEvent(value.toString()));
                  }),
              
           
             
            ],
          )),
  
                CupertinoButton(child: const Text('Aceptar'), onPressed: state.model.allDataIsOk! ? () {

                  showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ShowInfoaPage();
                    });


                }: null) ,
              ],
            );
          },
        ),
      ),
    );
  }


}



