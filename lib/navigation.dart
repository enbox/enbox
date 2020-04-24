import 'package:enbox/colors.dart';
import 'package:enbox/constants.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends RouteObserver<PageRoute> {
  factory AppRouteObserver() => _instance;

  AppRouteObserver._private();

  static final AppRouteObserver _instance = AppRouteObserver._private();
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;
  AppRouteObserver _routeObserver;

  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }

  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  accountName: const Text("Enbox"),
                  accountEmail: const Text("enbox@users.noreply.github.com"),
                ),
                ListTile(
                  leading: const Icon(Icons.check),
                  title: const Text(PageTitles.today),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.today);
                  },
                  selected: _selectedRoute == RouteNames.today,
                ),
              ],
            ),
          ),
          if (widget.permanentlyDisplay)
            const VerticalDivider(
              width: 1,
            ),
        ],
      ),
    );
  }
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({@required this.body, @required this.pageTitle, Key key})
      : super(key: key);

  final Widget body;
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    final Widget appBar = AppBar(
      automaticallyImplyLeading: displayMobileLayout,
      title: Text(pageTitle),
    );
    return displayMobileLayout
        ? Scaffold(
            appBar: appBar,
            drawer: const AppDrawer(
              permanentlyDisplay: false,
            ),
            body: body,
          )
        : Row(
            children: <Widget>[
              const AppDrawer(permanentlyDisplay: true),
              Expanded(
                child: Scaffold(
                  appBar: appBar,
                  body: body,
                ),
              ),
            ],
          );
  }
}
