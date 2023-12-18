import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fst/bloc/splash/splash_event.dart';
import 'package:fst/bloc/splash/splash_state.dart';
import 'package:fst/core/bloc/base_bloc.dart';

class SplashBloc extends BaseBloc<SplashEvent, SplashState> {
  SplashBloc(super.initialState) : super() {
    add(CheckLoginEvent());
  }
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> handleEvent(SplashEvent event, Emitter<SplashState> emit) async {
    if (event is CheckLoginEvent) {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          emit(
            SplashState(
              isLogin: auth.currentUser != null,
            ),
          );
        },
      );
    }
  }
}
