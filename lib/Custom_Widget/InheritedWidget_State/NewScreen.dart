import 'package:flutter/material.dart';

import 'Authentication_State.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, ${auth.user} 👋",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: auth.logout,
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
