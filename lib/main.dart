import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/config.dart';
import 'pages/timeline.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
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
          appBar: AppBar(
            title: Text('demo'),
          ),
          body: Stack(
            children: <Widget>[
              IndexedStack(
                index: _currentIndex,
                children: tabs,
              ),
            ],
          ),
          bottomNavigationBar: _buildBttomNavigator(context),
      ),
//      TabContainerBottom(),
//      TabContainerLoad1Time(),
//      TabContainerIndexedStack(),
//      TabContainer(),
    );

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