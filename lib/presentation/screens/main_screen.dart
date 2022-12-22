import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/base/widgets/base_screen.dart';
import 'package:quiz_app/presentation/screens/tabs/feed_tab.dart';
import 'package:quiz_app/presentation/screens/tabs/home_tab.dart';
import 'package:quiz_app/presentation/screens/tabs/profile_tab.dart';
import 'package:quiz_app/presentation/widgets/UI/navigation/botton_navigation.dart';
import 'package:quiz_app/presentation/widgets/navigators/TabNavigator.dart';

import '../../base/enums/TabItems.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage>{
  ///текущая страницы
  var _currentTab = TabItem.main;
  ///ключи для навигаторов
  final _navKeys = {
    TabItem.main: GlobalKey<NavigatorState>(),
    TabItem.feed: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>()
  };
  List<Widget> navigatorList = [];

  @override
  void initState() {
    navigatorList.add(TabNavigator(navigatorKey: _navKeys[TabItem.main], rootPage: HomeTab()));
    navigatorList.add(TabNavigator(navigatorKey: _navKeys[TabItem.feed], rootPage: FeedTab()));
    navigatorList.add(TabNavigator(navigatorKey: _navKeys[TabItem.profile], rootPage: ProfileTab()));
    super.initState();
  }

  void _onSelectTab(TabItem tabItem){
    if (tabItem == _currentTab) {
      _navKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          _buildNavigator(TabItem.main, navigatorList[0]),
          _buildNavigator(TabItem.feed, navigatorList[1]),
          _buildNavigator(TabItem.profile, navigatorList[2])
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentTab: _currentTab, onSelectTab: _onSelectTab),
    );

  }


  Widget _buildNavigator(TabItem tabItem, Widget navigator){
    return Offstage(
      offstage: _currentTab != tabItem,
      child: navigator,
    );
  }
}