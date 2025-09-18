import 'package:flutter/material.dart';

class RadioTileButton extends StatelessWidget {
  final String option;
  final String groupValue;
  final ValueChanged<String> onchange;

  const RadioTileButton(
      {super.key,
      required this.option,
      required this.groupValue,
      required this.onchange});

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text("Option $option"),
      value: option,
      groupValue: groupValue,
      onChanged: (value) => onchange(value!),
    );
  }
}
