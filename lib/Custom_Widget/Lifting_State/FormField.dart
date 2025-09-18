
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const EmailField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: "Enter Email"),
      onChanged: onChanged,
    );
  }
}
class NameField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const NameField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: "Enter Name"),
      onChanged: onChanged,
    );
  }
}