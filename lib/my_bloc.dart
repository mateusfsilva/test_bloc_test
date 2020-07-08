import 'package:bloc/bloc.dart';

enum MyState {
  initial,
  loading,
  fetched,
  calculated,
}

abstract class MyEvent {}

class MyEvent01 extends MyEvent {}

class MyEvent02 extends MyEvent {}

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc({
    this.someData,
  }) : super() {
    add(MyEvent01());
  }

  final String someData;

  @override
  MyState get initialState => MyState.initial;

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    if (event is MyEvent01) {
      yield MyState.loading;

      final int _ = someData?.length;

      yield MyState.fetched;
    } else if (event is MyEvent02) {
      yield MyState.loading;

      final List<String> _ = someData?.split(', ');

      yield MyState.calculated;
    }
  }

  void onMyEvent02() => add(MyEvent02());

  @override
  void onEvent(MyEvent event) {
    print('🧱 onEvent $runtimeType, $event 🧱\n');

    super.onEvent(event);
  }

  @override
  void onTransition(Transition<MyEvent, MyState> transition) {
    print('🧱 onTransition $runtimeType, $transition 🧱\n');

    super.onTransition(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('🧱 onError $runtimeType, $error, $stackTrace 🧱\n');

    super.onError(error, stackTrace);
  }
}
