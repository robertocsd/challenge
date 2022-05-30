import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'getting_info_event.dart';
part 'getting_info_state.dart';

class GettingInfoBloc extends Bloc<GettingInfoEvent, GettingInfoState> {
  GettingInfoBloc()
      : super(GettingInfoInitial(Model(bornDate: DateTime.now()))) {
    on<GettingNameEvent>(_getName);
    on<GettingLastName>(_getLastName);
    on<GettingPhone>(_getPhone);
    on<GettingDateEvent>(_getDate);
    on<CheckingData>(_checkData);
    on<GettingEmailEvent>(_getEmail);
    on<GettingSexoEvent>(_getSexo);
  }

  _getName(GettingNameEvent event, Emitter<GettingInfoState> emit) {
    event.data!.isEmpty == false
        ? emit(InfoGettedState(
            state.model.copyWith(firstName: event.data, firstNameError: false)))
        : emit(ErrorInData(state.model.copyWith(firstNameError: true)));
    add(CheckingData());
  }

  _getLastName(GettingLastName event, Emitter<GettingInfoState> emit) {
    event.data!.isEmpty == false
        ? emit(InfoGettedState(
            state.model.copyWith(lastNames: event.data, lastNameError: false)))
        : emit(ErrorInData(state.model.copyWith(lastNameError: true)));
    add(CheckingData());
  }

  _getPhone(GettingPhone event, Emitter<GettingInfoState> emit) {
    if (event.data!.isEmpty == true) {
      emit(ErrorInData(state.model.copyWith(phoneNumberError: true)));
    } else {
      emit(InfoGettedState(state.model
          .copyWith(phoneNumber: event.data, phoneNumberError: false)));
      add(CheckingData());
    }
  }

  _getDate(GettingDateEvent event, Emitter<GettingInfoState> emit) {
    final date1 = DateTime.now();
    if (date1.difference(event.data!).inDays * 0.002738 < 15) {
      emit(ErrorInData(state.model.copyWith(bornDateError: true)));
    } else {
      emit(InfoGettedState(state.model.copyWith(
          bornDate: event.data,
          bornDateError: false,
          age: (date1.difference(event.data!).inDays * 0.002738).toInt())));
      add(CheckingData());
    }
  }

  _checkData(CheckingData event, Emitter<GettingInfoState> emit) {
    if (state.model.firstNameError == false &&
        state.model.lastNameError == false &&
        state.model.phoneNumberError == false &&
        state.model.bornDateError == false &&
        state.model.emailError == false) {
      emit(InfoGettedState(state.model.copyWith(allDataIsOk: true)));
    } else {
      emit(ErrorInData(state.model.copyWith(allDataIsOk: false)));
    }
  }

  _getEmail(GettingEmailEvent event, Emitter<GettingInfoState> emit) {
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(event.data!)
        ? emit(InfoGettedState(
            state.model.copyWith(email: event.data, emailError: false)))
        : emit(ErrorInData(state.model.copyWith(emailError: true)));

    add(CheckingData());
  }

  _getSexo(GettingSexoEvent event, Emitter<GettingInfoState> emit) {
    emit(InfoGettedState(state.model.copyWith(sexo: event.data)));
    add(CheckingData());
  }
}
