import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_study/app/models/short_response_model.dart';
import 'package:to_study/app/pages/home/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class ShortBloc extends Bloc<ShortenedEvent, ShortenedState> {
  List<ShortResponse> copyOfResponseToUpdateState = [];
  RegExp regGex = RegExp(
      r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
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
      if (regGex.hasMatch(state.model.urlToBeShorted!)) {
        ShortResponse res =
            await repository.getShortURL(state.model.urlToBeShorted!);

        copyOfResponseToUpdateState.add(res);

        emit(UrlGettedState(state.model.copyWith(
            shortList: copyOfResponseToUpdateState,
            urlToBeShorted: state.model.urlToBeShorted)));
      } else {
        emit(ErrorInputURLState(state.model.copyWith(
            inputUrlError: true, urlToBeShorted: state.model.urlToBeShorted)));
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
