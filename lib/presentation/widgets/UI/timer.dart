import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../base/colors.dart';

class TimerBlock extends StatelessWidget{
  String time;
  String part;

  TimerBlock({required this.time, required this.part});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Color(0xFFCACACA), offset: Offset(0, 4), blurRadius: 4)
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontSize: 20)),
          Text(part, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}