import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/widgets/UI/answer/answer_button.dart';

import '../../../../data/models/question/question_model.dart';

class QuestionBlock extends StatefulWidget {
  int number;
  QuestionModel questionModel;
  QuestionBlock({super.key, required this.questionModel, required this.number});
  @override
  State<StatefulWidget> createState() => QuestionBlockState();
}

class QuestionBlockState extends State<QuestionBlock>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: animation.value,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(21)),
          child: Padding(
              padding: EdgeInsets.all(27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.number.toString(), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text(widget.questionModel.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(children: _buildAnswers()),
                  )
                ],
              )),
        ));
  }

  List<Widget> _buildAnswers() {
    List<Widget> answers = [];
    for (int i = 0; i < widget.questionModel.answers.length; i++) {
      if (widget.questionModel.answers.values.elementAt(i) != null) {
        final answerMap = widget.questionModel.answers.entries.elementAt(i);
        answers.add(AnswerButton(answerMap: answerMap));
      }
    }
    return answers;
  }
}
