import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/exceptions.dart';
import 'package:quiz_app/core/error/failures.dart';
import 'package:quiz_app/data/datasources/question_remote_datasource.dart';
import 'package:quiz_app/domain/entities/question/question.dart';
import 'package:quiz_app/domain/repositories/get_questions_repository.dart';
import 'package:quiz_app/domain/usecases/get_questions_usecase.dart';

import '../../core/platform/network_info.dart';
import '../models/question/question_model.dart';

class GetQuestionRepositoryImpl implements GetQuestionsRepository {
  final QuestionRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  GetQuestionRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      Params params) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteQuestion = await remoteDataSource.getQuestions(params);
        return Right(remoteQuestion);
      } on ServerException {
        return Left(ServerFailure("Unhandled server exception"));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ServerFailure("No internet connection"));
    }
  }
}
