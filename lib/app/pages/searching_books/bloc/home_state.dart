part of 'home_bloc.dart';

@immutable
abstract class ShortenedState extends Equatable {
  final Model model;

  const ShortenedState(this.model);

  @override
  List<Object> get props => [model];
}

class ShortInitialState extends ShortenedState {
  const ShortInitialState(Model model) : super(model);
}

class UrlSettedState extends ShortenedState {
  const UrlSettedState(Model model) : super(model);
}

class UrlGettedState extends ShortenedState {
  const UrlGettedState(Model model) : super(model);
}

class LoadingState extends ShortenedState {
  const LoadingState(Model model) : super(model);
}

class ErrorInputURLState extends UrlSettedState {
  const ErrorInputURLState(Model model) : super(model);
}

class Model extends Equatable {
  final String? urlToBeShorted;
  final List<Doc> shortList;
  final bool? inputUrlError;

  const Model(
      {this.urlToBeShorted,
      this.shortList = const [],
      this.inputUrlError = false});

  Model copyWith(
          {String? urlToBeShorted,
          List<Doc>? shortList,
          bool? inputUrlError}) =>
      Model(
        urlToBeShorted: urlToBeShorted,
        shortList: shortList ?? this.shortList,
        inputUrlError: inputUrlError ?? this.inputUrlError,
      );

  @override
  List<Object?> get props => [urlToBeShorted, shortList, inputUrlError];
}
