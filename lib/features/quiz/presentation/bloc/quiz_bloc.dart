import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart'; // For decoding HTML entities
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/core/usecase/quiz_use_case.dart';

import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizUseCase quizUseCase;
  final HtmlUnescape unescape = HtmlUnescape();

  QuizBloc(this.quizUseCase) : super(QuizInitial()) {
    on<FetchQuiz>(_onFetchQuiz);
    on<NextQuestionEvent>(_onNextQuestion);
    on<PreviousQuestionEvent>(_onPreviousQuestion);
    on<SelectAnswer>(_onSelectAnswer);
    on<SubmitQuiz>(_onSubmitQuiz);
  }

  Future<void> _onFetchQuiz(FetchQuiz event, Emitter<QuizState> emit) async {
    emit(QuizLoading()); // Emit loading state

    final result = await quizUseCase.call(
      QuizParam(amount: event.amount, type: event.type),
    );

    result.fold(
      (error) => emit(
          QuizError(errorMessage: error.message)), // Emit QuizError on failure
      (quizResponse) {
        emit(QuizLoaded(
          0,
          quizResponse: quizResponse,
          selectedAnswers: {},
        ));
      },
    );
  }

  void _onNextQuestion(NextQuestionEvent event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final newIndex = currentState.currentIndex! + 1;

      if (newIndex < currentState.quizResponse.results!.length) {
        emit(QuizLoaded(
          newIndex,
          quizResponse: currentState.quizResponse,
          selectedAnswers: currentState.selectedAnswers,
        ));
      }
    }
  }

  void _onPreviousQuestion(
      PreviousQuestionEvent event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final newIndex = currentState.currentIndex! - 1;

      if (newIndex >= 0) {
        emit(QuizLoaded(
          newIndex,
          quizResponse: currentState.quizResponse,
          selectedAnswers: currentState.selectedAnswers,
        ));
      }
    }
  }

  void _onSelectAnswer(SelectAnswer event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final updatedAnswers =
          Map<int, String>.from(currentState.selectedAnswers);

      updatedAnswers[event.questionIndex] =
          event.selectedAnswer.trim().toLowerCase();

      emit(QuizLoaded(
        currentState.currentIndex,
        quizResponse: currentState.quizResponse,
        selectedAnswers: updatedAnswers,
      ));
    }
  }

  void _onSubmitQuiz(SubmitQuiz event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final questions = currentState.quizResponse.results;
      final answers = currentState.selectedAnswers;

      int correctCount = 0;

      if (questions == null || questions.isEmpty) {
        emit(QuizError(errorMessage: AppString.noQuestions));
        return;
      }

      for (int i = 0; i < questions.length; i++) {
        String? selectedAnswer = answers[i] != null
            ? unescape.convert(answers[i]!).trim().toLowerCase()
            : null;
        String? correctAnswer = questions[i].correctAnswer != null
            ? unescape.convert(questions[i].correctAnswer!).trim().toLowerCase()
            : null;

        if (selectedAnswer != null && correctAnswer != null) {
          if (selectedAnswer == correctAnswer) {
            correctCount++;
          }
        }
      }

      double percentage = (correctCount / questions.length) * 100;

      String performanceMessage;
      if (percentage >= 90) {
        performanceMessage = AppString.excellent;
      } else if (percentage >= 75) {
        performanceMessage = AppString.greatJob;
      } else if (percentage >= 50) {
        performanceMessage = AppString.goodEffort;
      } else {
        performanceMessage = AppString.keepPracticing;
      }

      emit(QuizResult(
        correctAnswers: correctCount,
        totalQuestions: questions.length,
        performanceMessage: performanceMessage,
      ));
    }
  }
}
