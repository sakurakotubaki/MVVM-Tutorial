import 'package:auth_state_app/domain/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

final userProvider = Provider((ref) {
  return ref.watch(authStateProvider).user;
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(AuthState(FirebaseAuth.instance.currentUser)) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      state = AuthState(user);
    });
  }

  Future<void> signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}