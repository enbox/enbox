import 'package:enbox/constants.dart';
import 'package:enbox/common.dart';
import "package:enbox/theme.dart";
import "package:flutter/material.dart";

void main() => runApp(EnboxApp());

class EnboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: EnboxTheme.fallback,
      initialRoute: "/today",
      routes: {
        RouteNames.today: (_) => TodayPage(),
      },
    );
  }
}

class TodayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget testTile = const EnboxTile(
      sender: "Sender",
      smallNumber: 2,
      subject: "Subject here",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    );
    final Widget testGroup = Card(
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: List.filled(5, testTile),
        ).toList(),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
      semanticContainer: true,
    );
    return Scaffold(
      appBar: EnboxAppBar(),
      drawer: EnboxDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 31, left: 239, right: 239),
        itemBuilder: (context, _) => testGroup,
        separatorBuilder: (context, _) => const SizedBox(
          height: 67,
        ),
        itemCount: 5,
      ),
    );
  }
}
