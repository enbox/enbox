import 'package:flutter/material.dart';

class EnboxConstants extends InheritedWidget {
  static EnboxConstants of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<EnboxConstants>();
  const EnboxConstants({Widget child, Key key}) : super(key: key, child: child);

  final String displayName = "enbox";
  final Color color = Colors.blue;
  final String demoName = "Enbox Demo 2.1";
  final String demoEmail = "enbox@enbox.com";
  @override
  bool updateShouldNotify(EnboxConstants oldWidget) => false;
}
