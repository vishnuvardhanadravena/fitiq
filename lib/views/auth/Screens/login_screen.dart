import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/login_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);

    return Scaffold(
      body: Center(
        child: state.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  ref.read(loginProvider.notifier).login(
                        "eve.holt@reqres.in",
                        "cityslicka",
                      );
                },
                child: const Text("Login"),
              ),
      ),
    );
  }
}