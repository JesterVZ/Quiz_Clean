import 'package:dio/dio.dart';
import 'package:quiz_app/core/error/exceptions.dart';

import '../../base/http/HttpClient.dart';
import '../../domain/usecases/get_questions_usecase.dart';
import '../models/question/question_model.dart';
import 'package:quiz_app/base/enums/methods.dart';

abstract class QuestionRemoteDataSource {
  ///Calls the endpoint
  Future<List<QuestionModel>> getQuestions(Params params);
}

class QuestionRemoteDataSourceImpl implements QuestionRemoteDataSource {
  QuestionRemoteDataSourceImpl({this.httpClient});
  ApiClient? httpClient;
  @override
  Future<List<QuestionModel>> getQuestions(Params params) async {
    Response response = await httpClient!.sendRequest(Method.GET, null, params);
    if (response.statusCode == 200) {
      List<QuestionModel> result = [];
      for (int i = 0; i < response.data.length; i++) {
        result.add(QuestionModel.fromJson(response.data[i]));
      }
      return result;
    } else {
      throw ServerException();
    }
  }
}
