import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/question/question_model.dart';

class QuestionBlock extends StatefulWidget{
  QuestionModel questionModel;
  QuestionBlock({required this.questionModel});
  @override
  State<StatefulWidget> createState() => QuestionBlockState();
}

class QuestionBlockState extends State<QuestionBlock>{

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21)
      ),
      child: Padding(
        padding: EdgeInsets.all(27),
    child: Column(
      children: [

      ],
    )),
    );
  }
}