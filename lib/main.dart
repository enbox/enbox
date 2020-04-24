import 'package:enbox/constants.dart';
import 'package:enbox/navigation.dart';
import "package:enbox/theme.dart";
import "package:flutter/material.dart";

void main() => runApp(EnboxApp());

class EnboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: EnboxTheme.fallback,
      initialRoute: "/today",
      navigatorObservers: [AppRouteObserver()],
      routes: {
        RouteNames.today: (_) => TodayPage(),
      },
    );
  }
}

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      pageTitle: PageTitles.today,
      body: const Center(
        child: const Text("Today!"),
      ),
    );
  }
}
