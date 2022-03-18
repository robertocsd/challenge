part of 'home_bloc.dart';

@immutable
abstract class ShortenedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnGettingShortURL extends ShortenedEvent {
  final String urlToShort;

  OnGettingShortURL(this.urlToShort);
}

class OnGetShortURLEvent extends ShortenedEvent {}
