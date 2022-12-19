import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/error/failures.dart';
import 'package:quiz_app/domain/usecases/get_questions_usecase.dart';

import 'get_questions_state.dart';

part 'get_questions_event.dart';

class GetQuestionsBloc extends Bloc<GetQuestionsEvent, GetQuestionsState> {
  GetQuestionsBloc({this.getQuestionUseCase}) : super(GetQuestionsState.initial());
  GetQuestionUseCase? getQuestionUseCase;

  @override
  Stream<GetQuestionsState> mapEventToState(GetQuestionsEvent event) async*{
    if(event is GetQuestionsEvent){
      yield* _handleGetQuestions(event);
    }
  }

  Stream<GetQuestionsState> _handleGetQuestions(GetQuestionsEvent event) async*{
    yield state.copy(loading: true);
    final questions = await getQuestionUseCase!(Params(difficulty: event.difficulty));
    yield questions.fold(
        (failure) => state.copy(error: _mapFailureToMessage(failure)),
        (list) => state.copy(loading: true, questions: list));

  }

  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure:
        return "Server error";
      case CacheFailure:
        return "Local cache error";
    }
    throw Exception();
  }
}
