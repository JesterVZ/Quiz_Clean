import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/tabs/feed_tab.dart';
import 'package:quiz_app/presentation/screens/tabs/home_tab.dart';
import 'package:quiz_app/presentation/screens/tabs/profile_tab.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String feed = '/feed';
  static const String profile = '/profile';
}


class TabNavigator extends StatelessWidget{
  const TabNavigator({required this.navigatorKey, required this.rootPage});
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget rootPage;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context){
    return {
      TabNavigatorRoutes.root: (context) => rootPage,
      TabNavigatorRoutes.feed: (context) => FeedTab(),
      TabNavigatorRoutes.profile: (context) => ProfileTab()
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(builder: (context) => routeBuilders[routeSettings.name!]!(context));
      },
    );
  }
}