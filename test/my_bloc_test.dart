import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:test_bloc_test/my_bloc.dart';

void main() {
  MyBloc bloc;

  tearDown(() {
    bloc?.close();
  });

  group('Dart test', () {
    test('Test 01', () async {
      bloc = MyBloc(someData: 'A, B, C')..onMyEvent02();

      final List<MyState> expectedResult = <MyState>[
        MyState.initial,
        MyState.loading,
        MyState.fetched,
        MyState.loading,
        MyState.calculated,
      ];

      await expectLater(bloc.state, emitsInOrder(expectedResult));
    });
  });

  group('bloc_test', () {
    blocTest<MyBloc, MyEvent, MyState>(
      'Test 02',
      build: () async => MyBloc(someData: 'A, B, C'),
      act: (MyBloc bloc) async => bloc.onMyEvent02(),
      skip: 0,
      expect: <MyState>[
        MyState.initial,
        MyState.loading,
        MyState.fetched,
        MyState.loading,
        MyState.calculated,
      ],
    );
  });
}
