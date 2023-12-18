import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseBloc(S initialState) : super(initialState) {
    on<E>((event, emit) async {
      await handleEvent(event, emit);
    });
  }

  Future<void> handleEvent(E event, Emitter<S> emit);
}
