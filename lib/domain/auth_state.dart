import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  const AuthState(this.user);

  final User? user;
}