import 'package:flutter/cupertino.dart';
import 'package:quiz_app/base/widgets/base_screen.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Container());
  }
}