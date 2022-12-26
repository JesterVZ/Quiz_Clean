import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_app/core/error/failures.dart';
import 'package:quiz_app/core/usecases/usecase.dart';
import 'package:quiz_app/domain/entities/question/question.dart';

import '../../data/models/question/question_model.dart';
import '../repositories/get_questions_repository.dart';

class GetQuestionUseCase implements UseCase<List<Question>, Params>{
  final GetQuestionsRepository repository;
  GetQuestionUseCase(this.repository);

  @override
  Future<Either<Failure, List<QuestionModel>>> call(Params params) async {
    return await repository.getQuestions(params);
  }

}

class Params extends Equatable{
  final String difficulty;
  const Params({required this.difficulty});

  @override
  List<Object?> get props => [difficulty];
}