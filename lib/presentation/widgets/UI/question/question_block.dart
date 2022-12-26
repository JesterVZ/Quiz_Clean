import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/widgets/UI/answer/answer_button.dart';

import '../../../../data/models/question/question_model.dart';

class QuestionBlock extends StatefulWidget{
  int number;
  QuestionModel questionModel;
  QuestionBlock({super.key, required this.questionModel, required this.number});
  @override
  State<StatefulWidget> createState() => QuestionBlockState();
}

class QuestionBlockState extends State<QuestionBlock>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(21)
      ),
      child: Padding(
        padding: EdgeInsets.all(27),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.number.toString()),
        Text(widget.questionModel.question),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: _buildAnswers()
          ),
        )
        
      ],
    )),
    );
  }

  List<Widget> _buildAnswers(){
    List<Widget> answers = [];
    for(int i = 0; i < widget.questionModel.answers.length; i++){
      if(widget.questionModel.answers.values.elementAt(i) != null){
        answers.add(AnswerButton(answerLetter: _keyToLetter(widget.questionModel.answers.keys.elementAt(i)), answer: widget.questionModel.answers.values.elementAt(i)));
      }
      
    }
    return answers;
  }

  String _keyToLetter(String key){
    switch(key){
      case "answer_a":
      return "A";
      case "answer_b":
      return "B";
      case "answer_C":
      return "C";
      case "answer_D":
      return "D";
      case "answer_E":
      return "E";
      case "answer_F":
      return "F";
    }
    return "";
  }
}