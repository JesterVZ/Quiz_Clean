import 'package:quiz_app/domain/entities/question/question.dart';

import '../../../data/models/question/question_model.dart';

class GetQuestionsState {
  final bool? loading;
  final bool? isCorrectAnswer;

  final List<QuestionModel>? questions;
  final String? error;

  GetQuestionsState(
      {this.loading, this.questions, this.error, this.isCorrectAnswer});

  static initial() => GetQuestionsState(loading: false, error: null);

  GetQuestionsState copy(
      {bool? loading,
      bool? isCorrectAnswer,
      List<QuestionModel>? questions,
      String? error}) {
    return GetQuestionsState(
        loading: loading ?? this.loading,
        questions: questions ?? this.questions,
        error: error,
        isCorrectAnswer: isCorrectAnswer);
  }
}
