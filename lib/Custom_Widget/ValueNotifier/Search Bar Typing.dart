import 'package:flutter/material.dart';

class SearchExample extends StatelessWidget {
  const SearchExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<String> query = ValueNotifier("");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Type something...",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => query.value = val,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<String>(
              valueListenable: query,
              builder: (context, value, _) {
                return Text("Searching: $value");
              },
            ),
          ],
        ),
      ),
    );
  }
}
