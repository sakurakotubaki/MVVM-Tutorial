import 'package:auth_state_app/application/auth_state_notifier.dart';
import 'package:auth_state_app/application/sign_in_notifier.dart';
import 'package:auth_state_app/domain/sign_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(userProvider);

    // ref.listen<User?>(userProvider,
    //     (previous, next) {
    //   if (next != null) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const HomeWidget()),
    //     );
    //   }
    // });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user?.uid ?? ''),
            Text(user?.email ?? ''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(authStateProvider.notifier).signOut(),
        child: const Icon(Icons.logout),
      ),
    );
  }
}
