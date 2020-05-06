import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/config.dart';
import 'pages/timeline.dart';
import 'app_config.dart';
import 'nav/tab_navigator.dart';
import 'tab/bottom_navigator.dart';

void main() => runApp(MainPage());



class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  TabItem _currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.timeline: GlobalKey<NavigatorState>(),
    TabItem.config: GlobalKey<NavigatorState>(),
  };
  final items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('ホーム'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.timeline),
      title: Text('タイムライン'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('設定'),
    ),
  ];

  final tabs = <Widget>[
    Home(),
    TimeLine(),
    Config(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text('demo'),
          // ),
          body: Stack(
            children: <Widget>[
              _buildTabItem(
                TabItem.home,
                '/home',
              ),
              _buildTabItem(
                TabItem.timeline,
                '/timeline',
              ),
              _buildTabItem(
                TabItem.config,
                '/config',
              ),

              // IndexedStack(
              //   index: _currentIndex,
              //   children: tabs,
              // ),
            ],
          ),
          // bottomNavigationBar: _buildBttomNavigator(context),
          bottomNavigationBar: BottomNavigation(
            currentTab: _currentTab,
            onSelect: onSelect,
          ),
      ),
//      TabContainerBottom(),
//      TabContainerLoad1Time(),
//      TabContainerIndexedStack(),
//      TabContainer(),
    );
  }
  Widget _buildTabItem(
    TabItem tabItem,
    String root,
  ) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigationKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        routerName: root,
      ),
    );
  }

  void onSelect(TabItem tabItem) {
    if (_currentTab == tabItem) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }
    
  

  Widget _buildBttomNavigator(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: _currentIndex,
      onTap: (index) {
        if (_currentIndex != index) {
          setState(() {
            _currentIndex = index;
          });
        }
      },
    );
  }
}