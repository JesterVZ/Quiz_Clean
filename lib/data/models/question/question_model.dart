import 'package:quiz_app/domain/entities/question/question.dart';

class QuestionModel extends Question{
  QuestionModel({required super.id, required super.question, required super.answers, required super.correct_answers, required super.correct_answer, super.difficulty});

  factory QuestionModel.fromJson(Map<String, dynamic> map){
    return QuestionModel(
        id: map['id'],
        question: map['question'],
        answers: map['answers'],
        correct_answers: map['correct_answers'],
        correct_answer: map['correct_answer'],
        difficulty: map['difficulty']);
  }
}