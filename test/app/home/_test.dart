import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_study/app/models/short_response_model.dart';
import 'package:to_study/app/pages/home/bloc/home_bloc.dart';
import 'package:to_study/app/pages/home/repositories/home_repository.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  MockRepository? mockRepository;
  setUp(() {
    mockRepository = MockRepository();
  });

  const model = Model(urlToBeShorted: 'www.uca.com');
  Links? link = Links(short: 'uu', self: 'uu');
  ShortResponse short = ShortResponse(alias: 'ii', links: link);
  List<ShortResponse>? shortList = [short];

  blocTest<ShortBloc, ShortenedState>(
      'emits the complete flow since we get the data to fetch [UrlSettedState, LoadingState, UrlGettedState]',
      build: () {
        ShortBloc bloc = ShortBloc(repository: mockRepository);
        bloc.add(OnGettingShortURL(model.urlToBeShorted!));
        when(() => mockRepository!.getShortURL(model.urlToBeShorted!))
            .thenAnswer((_) async => Future.value(short));

        return bloc;
      },
      act: (bloc) {
        bloc.add(OnGetShortURLEvent());
      },
      expect: () => <ShortenedState>[
            const UrlSettedState(model),
            const LoadingState(model),
            UrlGettedState(model.copyWith(
                shortList: shortList, urlToBeShorted: model.urlToBeShorted))
          ]);
}
