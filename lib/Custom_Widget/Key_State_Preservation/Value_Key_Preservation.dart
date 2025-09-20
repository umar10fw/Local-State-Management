import 'package:flutter/material.dart';

class ValueKeyPreservation extends StatefulWidget {
  const ValueKeyPreservation({super.key});

  @override
  State<ValueKeyPreservation> createState() => _ValueKeyPreservationState();
}

class _ValueKeyPreservationState extends State<ValueKeyPreservation> {
  final List<String> field = ["Email", "Name", "Roll#", "Class"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: field.length,
      itemBuilder: (context, index) {
        return TextField(
          key: ValueKey(field[index]),
          decoration: InputDecoration(labelText: field[index]),
        );
      },
    );
  }
}
