import 'package:flutter/cupertino.dart';
import 'package:quiz_app/presentation/icons/my_flutter_app_icons.dart';

enum TabItem{
  main,
  feed,
  profile
}

const Map<TabItem, String> names = {
  TabItem.main: "Home",
  TabItem.feed: "Feed",
  TabItem.profile: "Profile"
};

const Map<TabItem, IconData> TabIcons = {
  TabItem.main: MyFlutterApp.home,
  TabItem.feed: MyFlutterApp.feed,
  TabItem.profile: MyFlutterApp.profile
};