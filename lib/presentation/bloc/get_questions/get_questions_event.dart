part of 'get_questions_bloc.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
  @override
  List<Object> get props => [];
}

class GetQuestionsEvent extends QuestionsEvent {
  String difficulty;
  GetQuestionsEvent(this.difficulty);
}

class CompareAnswersEvent extends QuestionsEvent {
  String answer_key; //ключ вопроса
  int answer_index; //номер вопроса
  //Params params;
  CompareAnswersEvent(this.answer_key, this.answer_index);
}
