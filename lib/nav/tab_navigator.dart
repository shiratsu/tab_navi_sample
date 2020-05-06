import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/config.dart';
import '../pages/timeline.dart';
import '../app_config.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    Key key,
    @required this.tabItem,
    @required this.routerName,
    @required this.navigationKey,
  }) : super(key: key);

  final TabItem tabItem;
  final String routerName;
  final GlobalKey<NavigatorState> navigationKey;

  Map<String, Widget Function(BuildContext)> _routerBuilder(BuildContext context) => {
    '/home': (context) => const Home(),
    '/timeline': (context) => const TimeLine(),
    '/config': (context) => const Config(),
  };

  @override
  Widget build(BuildContext context) {
    final routerBuilder = _routerBuilder(context);

    return Navigator(
      key: navigationKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return routerBuilder[routerName](context);
          },
        );
      },
    );
  }
}