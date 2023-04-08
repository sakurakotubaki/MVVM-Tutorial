import 'package:auth_state_app/application/auth_state_notifier.dart';
import 'package:auth_state_app/presentation/auth/sign_in.dart';
import 'package:auth_state_app/presentation/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? user = ref.watch(userProvider);

    return MaterialApp(
      home: user == null ? const SignInWidget() : const HomeWidget(),
    );
  }
}