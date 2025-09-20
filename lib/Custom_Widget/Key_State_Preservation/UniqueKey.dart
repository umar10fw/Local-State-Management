import 'dart:math';

import 'package:flutter/material.dart';

class Uniquekey_Preservation extends StatefulWidget {
  const Uniquekey_Preservation({super.key});

  @override
  State<Uniquekey_Preservation> createState() => _Uniquekey_PreservationState();
}

class _Uniquekey_PreservationState extends State<Uniquekey_Preservation> {
  final Random random = Random();
  Color color = Colors.pink;

  void ChangeColor() {
    setState(() {
      color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            key: UniqueKey(),
            height: 100,
            width: 100,
            color: color,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: ChangeColor,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), // makes button circular
                  padding: EdgeInsets.zero, // removes extra padding
                  backgroundColor: Colors.blue, // button color
                  foregroundColor: Colors.white, // icon color
                  elevation: 4, // shadow
                ),
                child: const Icon(
                  Icons.refresh,
                  size: 28, // icon size
                ),
              ),
              Text("Click the button to change color"),
            ],
          ),
        ],
      ),
    );
  }
}
