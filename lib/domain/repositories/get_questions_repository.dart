import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failures.dart';
import 'package:quiz_app/domain/entities/question/question.dart';

import '../../data/models/question/question_model.dart';
import '../usecases/get_questions_usecase.dart';

abstract class GetQuestionsRepository{
  Future<Either<Failure, List<QuestionModel>>> getQuestions(Params params);
}