import 'package:fst/core/bloc/base_state.dart';

class SplashState extends BaseState {
  final bool? isLogin;

  const SplashState({required this.isLogin});
  @override
  List<Object?> get props => [isLogin];
}
