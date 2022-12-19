import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/main_page.dart';
import 'package:quiz_app/internal/injection_container.dart' as di;

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
        primarySwatch: Colors.blue,
      ),
      home: MainPage());
  }
}