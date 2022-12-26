import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../base/colors.dart';

class AnswerButton extends StatelessWidget{
  String answerLetter;
  String answer;
  AnswerButton({required this.answerLetter, required this.answer});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(30),
        
      ),
      child: Row(children: [
        Text(answerLetter),
        Text(answer)
      ]),
    );
  }
}
