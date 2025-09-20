import 'package:flutter/material.dart';

class AuthProvider extends InheritedWidget {
  final String user;
  final VoidCallback logout;

  const AuthProvider({
    Key? key,
    required this.user,
    required this.logout,
    required Widget child,
  }) : super(key: key, child: child);

  static AuthProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthProvider>()!;
  }
  @override
  bool updateShouldNotify(AuthProvider oldWidget) {
    return user != oldWidget.user;
  }
}
