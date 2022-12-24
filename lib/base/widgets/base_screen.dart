import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../presentation/widgets/UI/navigation/botton_navigation.dart';

class BaseScreen extends StatefulWidget{

  Widget body;
  BaseScreen({super.key, required this.body});

  @override
  State<StatefulWidget> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      backgroundColor: Colors.white,
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Color(0xFF1A50F1),
            Color(0xFF6324CA)
          ])),
          child: widget.body,
      )

    );

  }
}