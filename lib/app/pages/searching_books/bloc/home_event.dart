part of 'home_bloc.dart';

@immutable
abstract class ShortenedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnGettingBook extends ShortenedEvent {
  final String urlToShort;

  OnGettingBook(this.urlToShort);
}

class OnGetBook extends ShortenedEvent {}
