import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../base/colors.dart';
import '../../../../base/enums/TabItems.dart';

class BottomNavigation extends StatelessWidget{
  TabItem currentTab;
  BottomNavigation({required this.currentTab});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        _buildItem(TabItem.main)
    ],
      currentIndex: 0,
      type: BottomNavigationBarType.fixed);
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem){
    return BottomNavigationBarItem(icon: Icon(TabIcons[tabItem], color: _colorMatching(tabItem)));
  }
  Color _colorMatching(TabItem item) {
    return currentTab == item ? mainColor : unselectedColor;
  }
}