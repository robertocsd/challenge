part of 'short_bloc.dart';

@immutable
abstract class ShortenedState  {
  final Model model;

  const ShortenedState(this.model);

  List<Object> get props => [model];
}

class ShortInitialState extends ShortenedState {
  const ShortInitialState(Model model) : super(model);
}

class UrlSettedState extends ShortenedState {
  const UrlSettedState(Model model) : super(model);
}

class LoaginShortedState extends ShortenedState {
  const LoaginShortedState(Model model) : super(model);
}

class ErrorInputURLState extends UrlSettedState {
  const ErrorInputURLState(Model model) : super(model);
}

class Model extends Equatable {
  final String? urlToBeShorted;
  final List<ShortResponse> shortList;
  final bool? inputUrlError;

  const Model( {
    this.urlToBeShorted,
    this.shortList = const [],
    this.inputUrlError = false
  });

  Model copyWith({String? urlToBeShorted, List<ShortResponse>? shortList, bool? inputUrlError}) 
  => Model(
        urlToBeShorted: urlToBeShorted ?? this.urlToBeShorted,
        shortList: shortList ?? this.shortList,
        inputUrlError: inputUrlError ?? this.inputUrlError,

      );

  @override
  List<Object?> get props => [
    urlToBeShorted,
    shortList,
    inputUrlError
    ];
}
