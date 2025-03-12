import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/feature/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_api_project_wc/feature/quiz/presentation/bloc/quiz_state.dart';
import 'package:quiz_api_project_wc/feature/quiz/presentation/widget/question_screen.dart';
import 'package:quiz_api_project_wc/feature/result/result_screen.dart';

import '../../../core/ui_components/custom_app_bar.dart';
import 'bloc/quiz_event.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizBloc>(context)
        .add(FetchQuiz(amount: 10, type: 'multiple'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppString.quiz,
      ),
      body: BlocBuilder<QuizBloc, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuizLoaded) {
            return QuestionScreen(
              state: state,
            );
          } else if (state is QuizError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is QuizResult) {
            return ResultScreen(
              correctAnswers: state.correctAnswers,
              totalQuestions: state.totalQuestions,
              performanceMessage: state.performanceMessage,
            );
          }
          return Center(child: Text("Unexpected Error"));
        },
      ),
    );
  }
}
