import "package:flutter/material.dart";
import "package:enbox/navbar.dart";
import "package:enbox/appbar.dart";
import "package:enbox/items_display.dart";

void main() => runApp(EnboxApp());

class EnboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EnboxHome());
  }
}

class EnboxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EnboxAppBar(),
      body: EnboxBody(),
    );
  }
}

class EnboxBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        EnboxNavbar(),
        EnboxItemsDisplay(
          "Today",
        ),
        //EnboxItemDisplay(),
      ],
    );
  }
}
