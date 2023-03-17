import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/base/routes.dart';
import 'package:quiz_app/domain/usecases/get_questions_usecase.dart';
import 'package:quiz_app/presentation/screens/main_screen.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';
import 'package:quiz_app/presentation/widgets/routes/CustomPageRoute.dart';

void main() {
  testWidgets("click on button", (WidgetTester tester) async {
    final button = find.byKey(ValueKey("StartButton"));
    final navigatorKey = GlobalKey<NavigatorState>();
    var page;

    await tester.pumpWidget(Provider(
      create: (context) => navigatorKey,
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case routeHome:
              page = MainPage();
              return MaterialPageRoute<dynamic>(
                  builder: (context) => page, settings: settings);
            case routeQuiz:
              page = QuizScreen(params: settings.arguments as Params);
              return CustomPageRoute(page: page);
          }
          return null;
        },
      ),
    ));

    await tester.tap(button);
    await tester.pump();
  });
}
