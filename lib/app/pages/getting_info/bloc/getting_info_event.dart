part of 'getting_info_bloc.dart';

abstract class GettingInfoEvent extends Equatable {
  const GettingInfoEvent();

  @override
  List<Object> get props => [];
}

class GettingNameEvent extends GettingInfoEvent {
  final String? data;

  const GettingNameEvent(this.data);
}

class GettingLastName extends GettingInfoEvent {
  final String? data;

  const GettingLastName(this.data);
}

class GettingPhone extends GettingInfoEvent {
  final String? data;

  const GettingPhone(this.data);
}

class GettingDateEvent extends GettingInfoEvent {
  final DateTime? data;

  const GettingDateEvent(this.data);
}

class GettingEmailEvent extends GettingInfoEvent {
  final String? data;

  const GettingEmailEvent(this.data);
}

class GettingSexoEvent extends GettingInfoEvent {
  final String? data;

  const GettingSexoEvent(this.data);
}

class CheckingData extends GettingInfoEvent {}
