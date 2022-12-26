import 'package:quiz_app/domain/entities/question/question.dart';

import '../../../data/models/question/question_model.dart';

class GetQuestionsState{
  final bool? loading;
  final List<QuestionModel>? questions;
  final String? error;


  GetQuestionsState({this.loading, this.questions, this.error});
  static initial() => GetQuestionsState(loading: false, error: null);
  GetQuestionsState copy({bool? loading, List<QuestionModel>? questions, String? error}){
    return GetQuestionsState(
      loading: loading ?? this.loading, 
      questions: questions, 
      error: error);
  }
}