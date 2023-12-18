import 'package:flutter/material.dart';
import 'package:fst/bloc/splash/splash_bloc.dart';
import 'package:fst/bloc/splash/splash_event.dart';
import 'package:fst/bloc/splash/splash_state.dart';
import 'package:fst/core/widget/base_widget.dart';
import 'package:fst/generated/assets.gen.dart';

class SplashPage extends BaseView<SplashState, SplashEvent, SplashBloc> {
  const SplashPage({super.key});

  @override
  Widget buildView(BuildContext context, SplashState state) {
    return Scaffold(
      body: Center(
        child: Assets.images.logo.image(),
      ),
    );
  }
}
