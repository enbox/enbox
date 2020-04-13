import 'package:enbox/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  EnboxConstants(
    child: EnboxApp(),
  ),
);

class EnboxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EnboxConstants constants = EnboxConstants.of(context);
    return MaterialApp(
      title: constants.displayName,
      theme: ThemeData(
        primaryColor: constants.color,
      ),
      home: EnboxHome(title: constants.displayName),
    );
  }
}

class EnboxHome extends StatefulWidget {
  EnboxHome({Key key, this.title}) : super(key: key);
  final String title;
  @override
  EnboxHomeState createState() => EnboxHomeState();
}

class EnboxHomeState extends State<EnboxHome> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    EnboxConstants constants = EnboxConstants.of(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              accountName: Text(constants.demoName),
              accountEmail: Text(constants.demoEmail),
              currentAccountPicture: Icon(
                Icons.account_circle,
                size: 50.0,
                color: Colors.white
              ),
            )
          ],
        )
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 13.0),
            child: Icon(
              Icons.search,
              size: 25.0
            )
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times!'),
            Text('$_counter', style: Theme.of(context).textTheme.display1),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.edit),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}