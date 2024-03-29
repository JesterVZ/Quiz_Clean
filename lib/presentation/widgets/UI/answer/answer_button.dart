import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/presentation/screens/quiz_screen.dart';

import '../../../../base/colors.dart';
import '../../../../internal/injection_container.dart';
import '../../../bloc/get_questions/get_questions_bloc.dart';

class AnswerButton extends StatelessWidget {
  MapEntry
      answerMap; //ключ и значение. По ключу будем сравнивать правильный ответ
  AnswerButton({super.key, required this.answerMap});
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
            onTap: () {
              int questionIndex = context.read<QuestionIndex>().index;
              context
                  .read<GetQuestionsBloc>()
                  .add(CompareAnswersEvent(answerMap.key, questionIndex));
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Flexible(
                    child: Text(answerMap.value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
