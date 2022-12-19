import 'package:dio/dio.dart';
import 'package:quiz_app/base/enums/Methods.dart';

import '../../domain/usecases/get_questions_usecase.dart';

class ApiClient{
  final Dio _apiClient = _getDio(baseUrl: '');
  String key = "fJePVln5aDjkqLG04QBzBOChCWsCZMCD8oxLB3hl";
  static Dio _getDio({String? baseUrl}) {
    return Dio(BaseOptions(
      baseUrl: baseUrl ?? '',
      connectTimeout: 30000,
      contentType: Headers.jsonContentType,
    ));
  }

  Future<Response> sendRequest(Method method, String? path, Params params) async{
    switch(method){
      case Method.GET:
        return await _apiClient.get(path ?? "https://quizapi.io/api/v1/questions?apiKey=$key&limit=10&difficulty=${params.difficulty}");
      case Method.POST:
        return await _apiClient.post(path ?? "https://quizapi.io/api/v1/questions?apiKey=$key&limit=10&difficulty=${params.difficulty}");
    }

  }

}