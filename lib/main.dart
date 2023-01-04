import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/screens/main_screen.dart';
import 'package:quiz_app/internal/injection_container.dart' as di;
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/routes/CustomPageRoute.dart';

import 'base/colors.dart';
import 'base/routes.dart';
import 'domain/usecases/get_questions_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.startup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final navigatorKey = GlobalKey<NavigatorState>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => navigatorKey,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Quiz Application',
          theme: ThemeData(
              fontFamily: 'Roboto',
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(primary: mainColor, secondary: Colors.white)),
          onGenerateRoute: (settings) {
            late Widget page;
            switch (settings.name) {
              case routeHome:
                page = MainPage();
                return MaterialPageRoute<dynamic>(
                    builder: (context) => page, settings: settings);
              case routeQuiz:
                page = QuizScreen(params: settings.arguments as Params);
                return CustomPageRoute(page: page);
            }

            //return MaterialPageRoute<dynamic>(builder: (context) => page, settings: settings);
          },
        ));
  }
}
