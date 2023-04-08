// ignore_for_file: unnecessary_null_comparison

import 'package:auth_state_app/application/sign_in_notifier.dart';
import 'package:auth_state_app/domain/sign_state.dart';
import 'package:auth_state_app/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInWidget extends ConsumerWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignInState state = ref.watch(signInStateProvider);

    // ref.listen<SignInState>(signInStateProvider, (previous, next) {
    //     if (previous != null) {

    //     }
    // });

      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) =>
                  ref.read(signInStateProvider.notifier).setEmail(value),
              initialValue: state.email,
            ),
            TextFormField(
              onChanged: (value) =>
                  ref.read(signInStateProvider.notifier).setPassword(value),
              initialValue: state.password,
            ),
            ElevatedButton(
              onPressed: () =>
                  ref.read(signInStateProvider.notifier).signIn(),
              child: const Text('Sign In'),
            ),
            if (state.error != null)
              Text(state.error.toString()),
          ],
        ),
    );
  }
}