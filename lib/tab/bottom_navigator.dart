import 'package:flutter/material.dart';

import '../app_config.dart';

const tabTitle = <TabItem, String>{
  TabItem.home: 'ホーム',
  TabItem.timeline: 'タイムライン',
  TabItem.config: '設定',
};
const tabIcon = <TabItem, IconData>{
  TabItem.home: Icons.home,
  TabItem.timeline: Icons.timeline,
  TabItem.config: Icons.settings,
};

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key key,
    this.currentTab,
    this.onSelect,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelect;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        bottomItem(
          context,
          tabItem: TabItem.home,
        ),
        bottomItem(
          context,
          tabItem: TabItem.timeline,
        ),
        bottomItem(
          context,
          tabItem: TabItem.config,
        ),
      ],
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onSelect(TabItem.values[index]);
      },
    );
  }

  BottomNavigationBarItem bottomItem(
    BuildContext context, {
    TabItem tabItem,
  }) {
    final color = currentTab == tabItem ? Colors.blue : Colors.black26;
    return BottomNavigationBarItem(
      icon: Icon(
        tabIcon[tabItem],
        color: color,
      ),
      title: Text(
        tabTitle[tabItem],
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }
}