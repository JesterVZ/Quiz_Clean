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
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(30),

      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(30),
          onTap: (){},
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Flexible(child: Text(answer),),
              ],
            ),
          )
        ),
      ),
    );
  }
}
