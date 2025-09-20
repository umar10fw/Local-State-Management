import 'dart:math';
import 'package:flutter/material.dart';

class ObjectkeyPreservation extends StatefulWidget {
  const ObjectkeyPreservation({super.key});

  @override
  State<ObjectkeyPreservation> createState() => _ObjectkeyPreservationState();
}

class _ObjectkeyPreservationState extends State<ObjectkeyPreservation> {
  List<User> users = [
    User("Umar"),
    User("Ahmad"),
    User("Hassan"),
  ];

  void shuffled() {
    setState(() {
      users.shuffle(Random());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: users
                .map((user) => ListTile(
              key: ObjectKey(user),
              title: Text(user.name),
              leading: const Icon(Icons.person),
            ))
                .toList(),
          ),
        ),
        ElevatedButton(
          onPressed: shuffled,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), // makes button circular
            padding: EdgeInsets.zero,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            elevation: 4,
          ),
          child: const Icon(
            Icons.refresh,
            size: 28,
          ),
        ),
      ],
    );
  }
}

class User {
  final String name;
  User(this.name);
}
