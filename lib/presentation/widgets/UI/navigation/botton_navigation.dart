import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../base/colors.dart';
import '../../../../base/enums/TabItems.dart';

class BottomNavigation extends StatelessWidget{
  ///Кастомный BottomNavigationBar
  ///
  /// Принимает конкретный [TabItem] в качестве текущей стрвницы
  TabItem currentTab;
  Function(TabItem tabItem) onSelectTab;
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFCFCFCF),
            spreadRadius: 5,
            blurRadius: 50,
            offset: Offset(7, 10),
          ),
        ]
      ),
      child: BottomNavigationBar(
        items: [
          _buildItem(TabItem.main),
          _buildItem(TabItem.feed),
          _buildItem(TabItem.profile),
      ], onTap: (index) {
        onSelectTab(TabItem.values[index]);
      },
        currentIndex: currentTab.index,
        type: BottomNavigationBarType.fixed),
    );

  }

  BottomNavigationBarItem _buildItem(TabItem tabItem){
    return BottomNavigationBarItem(icon: Icon(TabIcons[tabItem], color: _colorMatching(tabItem)), label: names[tabItem]);
  }
  Color _colorMatching(TabItem item) {
    return currentTab == item ? mainColor : unselectedColor;
  }
}