class SignInState {
  const SignInState(
    this.email,
    this.password,
    this.error,
  );

  final String email;
  final String password;
  final Object? error;
}