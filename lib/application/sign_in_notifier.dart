// ignore_for_file: prefer_const_constructors, unused_catch_stack

import 'package:auth_state_app/application/auth_state_notifier.dart';
import 'package:auth_state_app/domain/sign_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInStateProvider =
    StateNotifierProvider.autoDispose<SignInNotifier, SignInState>((ref) {
  return SignInNotifier(ref);
});

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier(this.ref) : super(SignInState('', '', null));

  final Ref ref;

  void setEmail(String value) => state = SignInState(value, state.password, state.error);
  void setPassword(String value) => state = SignInState(state.email, value, state.error);

  Future<void> signIn() async {
    try {
      await ref.read(authStateProvider.notifier).signIn(
        state.email,
        state.password,
      );
    } catch (error, stackTrace) {
      state = SignInState(state.email, state.password, error);
    }
  }
}