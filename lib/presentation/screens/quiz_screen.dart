import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/base/widgets/base_screen.dart';
import 'package:quiz_app/internal/injection_container.dart';
import 'package:quiz_app/presentation/bloc/get_questions/get_questions_state.dart';
import 'package:quiz_app/presentation/widgets/UI/error/ErrorBlock.dart';

import '../bloc/get_questions/get_questions_bloc.dart';
import '../widgets/UI/header.dart';

class QuizScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _QuizScreen();
}

class _QuizScreen extends State<QuizScreen>{

  @override
  void initState() {
    BlocProvider.of<GetQuestionsBloc>(context).add(GetQuestionsEvent("hard"));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: buildBody(context));
  }

  BlocProvider<GetQuestionsBloc> buildBody(BuildContext context){

    return BlocProvider(
      create: (_) => locator<GetQuestionsBloc>(),
      child: Column(
      children: [
        Header(text: "Quiz",),
        BlocBuilder<GetQuestionsBloc, GetQuestionsState>(
          builder: (context, state){
            if(state.error != null){
              return ErrorBlock(errorText: state.error!);
            }
            if(state.questions!.isNotEmpty){
              return
            }
          },
        )
      ],
    ));
  }


}