import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/error/failures.dart';
import 'package:quiz_app/domain/usecases/get_questions_usecase.dart';

import 'get_questions_state.dart';

part 'get_questions_event.dart';

class GetQuestionsBloc extends Bloc<QuestionsEvent, GetQuestionsState> {
  GetQuestionsBloc({this.getQuestionUseCase}) : super(GetQuestionsState.initial()){
    on((GetQuestionsEvent event, Emitter<GetQuestionsState> emit) async{
      emit.call(state.copy(loading: true));
      final questions = await getQuestionUseCase!(Params(difficulty: event.difficulty));
      questions.fold(
              (failure) {
                emit.call(state.copy(loading: false, error: _mapFailureToMessage(failure)));
              },
              (list) {
                emit.call(state.copy(loading: false, questions: list));
              }
      );
    });
  }
  GetQuestionUseCase? getQuestionUseCase;



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
