import 'package:quiz_app/domain/entities/question/question.dart';

class GetQuestionsState{
  final bool? loading;
  final List<Question>? questions;
  final String? error;


  GetQuestionsState({this.loading, this.questions, this.error});
  static initial() => GetQuestionsState(loading: false, error: null);
  GetQuestionsState copy({bool? loading, List<Question>? questions, String? error}){
    return GetQuestionsState(loading: loading ?? this.loading, questions: this.questions, error: error);
  }
}