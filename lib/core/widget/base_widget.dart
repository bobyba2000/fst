import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/base_bloc.dart';
import '../bloc/base_event.dart';
import '../bloc/base_state.dart';
import '../dependencies/app_dependencies.dart';

abstract class BaseView<S extends BaseState, E extends BaseEvent, B extends BaseBloc<E, S>> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: BlocProvider<B>(
        create: (context) => (createBloc() ?? AppDependencies.injector.get<B>()),
        child: BlocConsumer<B, S>(
          builder: (context, state) {
            return buildView(context, state);
          },
          listener: (context, state) {
            handleState(context, state);
          },
          buildWhen: (S previous, S current) {
            return rebuildViewWhen(previous, current);
          },
        ),
      ),
    );
  }

  bool rebuildViewWhen(S previous, S current) => true;

  B? createBloc() => null;

  void handleState(BuildContext context, S state) {}

  Widget buildView(BuildContext context, S state);
}
