part of 'getting_info_bloc.dart';

abstract class GettingInfoState extends Equatable {
  final Model model;

  const GettingInfoState(this.model);

  @override
  List<Object> get props => [model];
}

class GettingInfoInitial extends GettingInfoState {
  const GettingInfoInitial(Model model) : super(model);
}

class InfoGettedState extends GettingInfoState {
  const InfoGettedState(Model model) : super(model);
}

class ErrorInData extends GettingInfoState {
  const ErrorInData(Model model) : super(model);
}

class Model extends Equatable {
  final String? firstName;
  final bool? firstNameError;
  final String? phoneNumber;

  final String? lastNames;
  final bool? lastNameError;
  final bool? phoneNumberError;
  final DateTime? bornDate;
  final bool? bornDateError;
  final bool? allDataIsOk;
  final String? email;
  final bool? emailError;
  final String? sexo;
  final int? age;
  const Model({
    this.emailError = true,
    this.email = '',
    this.firstName = '',
    this.phoneNumber = '',
    this.lastNames = '',
    this.firstNameError = true,
    this.lastNameError= true ,
    this.phoneNumberError = true,
    this.bornDate ,
    this.bornDateError = true,
    this.allDataIsOk = false,
    this.sexo = 'Femenino',
    this.age = 0

  });

  Model copyWith(
          {String? firstName,
          String? lastNames,
          bool? firstNameError,
          String? phoneNumber,
          bool? lastNameError,
          bool? phoneNumberError,
          DateTime? bornDate,
          bool? bornDateError,
          String? email,
          bool? emailError,
          String? sexo,
          int? age,
          bool? allDataIsOk}) =>
      Model(
        firstName: firstName ?? this.firstName,
        lastNames: lastNames ?? this.lastNames,
        firstNameError: firstNameError ?? this.firstNameError,
        lastNameError: lastNameError ?? this.lastNameError,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        phoneNumberError: phoneNumberError ?? this.phoneNumberError,
        bornDate: bornDate ?? this.bornDate,
        bornDateError: bornDateError ?? this.bornDateError,
        allDataIsOk: allDataIsOk ?? this.allDataIsOk,
        email: email ?? this.email,
        age: age ?? this.age,
        sexo: sexo ?? this.sexo,
        emailError: emailError ?? this.emailError
      );

  @override
  List<Object?> get props => [
        firstName,
        lastNames,
        firstNameError,
        lastNameError,
        phoneNumber,
        phoneNumberError,
        bornDate,
        bornDateError,
        allDataIsOk,
        email,
        emailError,
        sexo,
        age
      ];
}
