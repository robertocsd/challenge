import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:to_study/app/models/short_response_model.dart';
import 'package:to_study/app/pages/home/bloc/home_bloc.dart';

import 'package:to_study/app/pages/home/home.dart';

class MockiBloc extends MockBloc<ShortenedEvent, ShortenedState>
    implements ShortBloc {}

class AuthenticationStateFake extends Fake implements UrlGettedState {}

void main() {
  setUpAll(() {
    registerFallbackValue(AuthenticationStateFake());
  });
  testWidgets('writing in textfield', (WidgetTester tester) async {
    final addField = find.byKey(const ValueKey('Input'));

    await tester.pumpWidget(MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ShortBloc())],
        child: const MaterialApp(home: HomePage())));

    await tester.enterText(addField, "https://www.com.com");

    expect(find.text("https://www.com.com"), findsOneWidget);
  });
  testWidgets('See if theres a list when we fetch an URL',
      (WidgetTester tester) async {
    const model = Model(urlToBeShorted: 'www.uca.com');
    Links? link = Links(short: 'uu', self: 'uu');
    ShortResponse short = ShortResponse(alias: 'ii', links: link);
    List<ShortResponse>? shortList = [short];

    final mockAuthenticationBloc = MockiBloc();
    when(() => mockAuthenticationBloc.state).thenReturn(
      UrlGettedState(model.copyWith(
          shortList: shortList,
          urlToBeShorted: model.urlToBeShorted)), // the desired state
    );
    await tester.pumpWidget(
      BlocProvider<ShortBloc>(
        create: (context) => mockAuthenticationBloc,
        child: const MaterialApp(
          home: Scaffold(
            body: HomePage(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('List')), findsOneWidget);
  });
}

// }
