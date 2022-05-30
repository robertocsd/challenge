import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_study/app/models/books_response_model.dart';
import 'package:to_study/app/pages/searching_books/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class ShortBloc extends Bloc<ShortenedEvent, ShortenedState> {
  late Repository repository;

  ShortBloc({Repository? repository}) : super(initialState) {
    this.repository = repository ?? Repository();
    on<OnGettingShortURL>(_onGeetingShorUrl);
    on<OnGetShortURLEvent>(_onGetShortURLEvent);
  }

  static ShortenedState get initialState =>
      const ShortInitialState(Model(urlToBeShorted: ''));

  void _onGeetingShorUrl(
      OnGettingShortURL event, Emitter<ShortenedState> emit) {
    emit(
        UrlSettedState(state.model.copyWith(urlToBeShorted: event.urlToShort)));
  }

  void _onGetShortURLEvent(
      OnGetShortURLEvent event, Emitter<ShortenedState> emit) async {
    emit(LoadingState(state.model));

    try {
      BooksResponse res =
          await repository.getShortURL(state.model.urlToBeShorted!);


      emit(UrlGettedState(state.model.copyWith(
          shortList: res.docs, urlToBeShorted: state.model.urlToBeShorted)));
    } catch (e) {
      throw Exception(e);
    }
  }
}
