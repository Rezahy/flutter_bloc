import 'dart:developer';

import 'package:bloc/bloc.dart';

// enum CounterEvent { increament, increamentTwice, increamentR }

abstract class CounterEvent {}

class Increament extends CounterEvent {
  final int payload;
  Increament({required this.payload});
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<CounterEvent>((event, emit) async {
      switch (event.runtimeType) {
        case Increament:
          emit(state + (event as Increament).payload);
        // case CounterEvent.increament:
        //   emit(state + 1);
        //   break;
        // case CounterEvent.increamentTwice:
        //   emit(state + 2);
        //   break;
        // case CounterEvent.increamentR:
        //   await Future.delayed(
        //     Duration(seconds: 5),
        //   );
        //   emit(state + 5);
        //   break;
      }
    });
  }
}
