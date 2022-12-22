import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/main_screen.dart';
import 'package:quiz_app/internal/injection_container.dart' as di;

import 'base/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.startup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Application',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch().copyWith(
         primary: mainColor,

         secondary: Colors.white
        )
      ),
      home: MainPage());
  }
}