import 'package:flutter/material.dart';

class FormValidationExample extends StatelessWidget {
  const FormValidationExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isValid = ValueNotifier(false);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter some text",
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => isValid.value = val.isNotEmpty,
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<bool>(
              valueListenable: isValid,
              builder: (context, valid, _) {
                return ElevatedButton(
                  onPressed: valid ? () {} : null,
                  child: const Text("Submit"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
