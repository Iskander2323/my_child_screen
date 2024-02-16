// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  const SimpleBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('BlocEvent: ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('BlocChange: ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('BlocCreated: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('BlocClosed: ${bloc.runtimeType}');
  }


  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
