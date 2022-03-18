import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:to_study/api/movies_get.dart';
import 'package:to_study/models/short_response_model.dart';

part 'short_event.dart';
part 'short_state.dart';

class ShortBloc extends Bloc<ShortenedEvent, ShortenedState> {
  List<ShortResponse> copyOfResponseToUpdateState = [];
  RegExp regGex = RegExp(
      r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
  final Repository repository;
  ShortBloc([Repository? repository])
      : repository = repository ??= Repository(),
        super(initialState) {
    on<OnGettingShortURL>(_onGeetingShorUrl);
    on<OnGetShortURLEvent>(_onGetShortURLEvent);
  }

  static ShortenedState get initialState => const ShortInitialState(Model());

  void _onGeetingShorUrl(
      OnGettingShortURL event, Emitter<ShortenedState> emit) {
    emit(
        UrlSettedState(state.model.copyWith(urlToBeShorted: event.urlToShort)));
  }

  void _onGetShortURLEvent(
      OnGetShortURLEvent event, Emitter<ShortenedState> emit) async {
    try {
      if (regGex.hasMatch(state.model.urlToBeShorted!)) {
        emit(LoadingState(state.model));
        ShortResponse res =
            await repository.getShortURL(state.model.urlToBeShorted!);

        copyOfResponseToUpdateState.add(res);

        emit(UrlSettedState(state.model.copyWith(
          shortList: copyOfResponseToUpdateState,
        )));
      } else {
        emit(ErrorInputURLState(state.model.copyWith(inputUrlError: true)));
      }
    } catch (e) {
      //TODO EXCEPCION STATE

    }
  }
}
