import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/base/widgets/base_screen.dart';
import 'package:quiz_app/internal/injection_container.dart';
import 'package:quiz_app/presentation/bloc/get_questions/get_questions_state.dart';
import 'package:quiz_app/presentation/widgets/UI/question/question_block.dart';
import 'package:quiz_app/presentation/widgets/UI/result/result_block.dart';

import '../../domain/usecases/get_questions_usecase.dart';
import '../bloc/get_questions/get_questions_bloc.dart';
import '../widgets/UI/error/Error_block.dart';
import '../widgets/UI/header.dart';

class QuizScreen extends StatefulWidget {
  Params params;
  QuizScreen({required this.params});
  @override
  State<StatefulWidget> createState() => _QuizScreen();
}

class _QuizScreen extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        body: Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: buildBody(context),
    ));
  }

  BlocProvider<GetQuestionsBloc> buildBody(BuildContext context) {
    final bloc = locator<GetQuestionsBloc>()..add(GetQuestionsEvent("hard"));
    List<QuestionBlock> questions = [];
    Widget content = Container();
    bool isLoading = false;
    QuestionIndex questionIndex = QuestionIndex();

    List<GlobalKey<QuestionBlockState>> keys = [];

    return BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder<GetQuestionsBloc, GetQuestionsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state.loading == true) {
              isLoading = state.loading!;
            } else {
              isLoading = false;
            }
            if (state.error != null) {
              content = ErrorBlock(errorText: state.error!);
            }
            if (state.questions != null && state.questions!.isNotEmpty) {
              for (int i = 0; i < state.questions!.length; i++) {
                keys.add(GlobalKey<QuestionBlockState>());
                questions.add(QuestionBlock(
                    key: keys[i],
                    questionModel: state.questions![i],
                    number: (i + 1)));
              }
              content = Column(
                children: [questions[questionIndex.index]],
              );
            }
            if (state.isCorrectAnswer == true) {
              questionIndex.index++;
              content = Column(
                children: [questions[questionIndex.index]],
              );
            } else if (state.isCorrectAnswer == false) {
              content = const ResultBlock();
            }
            return MultiProvider(
              providers: [
                Provider(create: (context) => bloc),
                ChangeNotifierProvider(
                  create: (context) => questionIndex,
                )
              ],
              child: Stack(
                children: [
                  Column(
                    children: [
                      Header(text: "Quiz"),
                      Expanded(
                          child: SingleChildScrollView(
                        child: content,
                      ))
                    ],
                  ),
                  Visibility(
                      visible: isLoading,
                      child: const Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}

class QuestionIndex extends ChangeNotifier {
  int index = 0;

  plus() {
    index++;
    notifyListeners();
  }
}
