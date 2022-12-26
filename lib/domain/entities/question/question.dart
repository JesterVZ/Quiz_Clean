import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Question extends Equatable{
  int id;
  String question;
  String? description;
  Map answers;
  String? multiple_correct_answers;
  Map correct_answers;
  String correct_answer;
  String? explanation;
  String? tip;
  String? category;
  String? difficulty;

  Question({
      required this.id,
      required this.question,
      this.description,
      required this.answers,
      this.multiple_correct_answers,
      required this.correct_answers,
      required this.correct_answer,
      this.explanation,
      this.tip,
      this.category,
      this.difficulty});

  @override
  List<Object?> get props => [id, question, answers];

}