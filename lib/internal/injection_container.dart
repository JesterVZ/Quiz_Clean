import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quiz_app/core/platform/network_info.dart';
import 'package:quiz_app/data/datasources/question_remote_datasource.dart';
import 'package:quiz_app/data/repositories/get_question_repository_impl.dart';
import 'package:quiz_app/domain/repositories/get_questions_repository.dart';
import 'package:quiz_app/domain/usecases/get_questions_usecase.dart';
import 'package:quiz_app/presentation/bloc/get_questions/get_questions_bloc.dart';

import '../base/http/HttpClient.dart';

final locator = GetIt.instance;

Future<void> startup() async{
  locator.registerFactory(() => GetQuestionsBloc(getQuestionUseCase: locator()));
  locator.registerLazySingleton(() => GetQuestionUseCase(locator()));
  locator.registerLazySingleton<GetQuestionsRepository>(() => GetQuestionRepositoryImpl(remoteDataSource: locator(), networkInfo: locator()));
  locator.registerLazySingleton<QuestionRemoteDataSource>(() => QuestionRemoteDataSourceImpl(httpClient: locator()));
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator.registerLazySingleton(() => InternetConnectionChecker());
}