import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html_unescape/html_unescape.dart'; // For decoding HTML entities
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';

import 'quiz_event.dart';
import 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final UseCase useCase;
  final HtmlUnescape unescape = HtmlUnescape(); // Initialize HTML decoder

  QuizBloc(this.useCase) : super(QuizInitial()) {
    on<FetchQuiz>(_onFetchQuiz);
    on<SelectAnswer>(_onSelectAnswer);
    on<SubmitQuiz>(_onSubmitQuiz);
  }

  // Handle FetchQuiz event
  Future<void> _onFetchQuiz(FetchQuiz event, Emitter<QuizState> emit) async {
    emit(QuizLoading()); // Emit loading state

    final result = await useCase.call(
      QuizParam(amount: event.amount, type: event.type),
    ); // Call use case

    result.fold(
      (error) => emit(
          QuizError(errorMessage: error.message)), // On error, emit QuizError
      (quizResponse) {
        emit(QuizLoaded(
          quizResponse: quizResponse,
          selectedAnswers: {}, // Initialize as empty map
        ));
      },
    );
  }

  // Handle SelectAnswer event
  void _onSelectAnswer(SelectAnswer event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final updatedAnswers =
          Map<int, String>.from(currentState.selectedAnswers);

      updatedAnswers[event.questionIndex] =
          event.selectedAnswer.trim().toLowerCase();

      emit(QuizLoaded(
        quizResponse: currentState.quizResponse,
        selectedAnswers: updatedAnswers,
      ));
    }
  }

  // Handle SubmitQuiz event
  void _onSubmitQuiz(SubmitQuiz event, Emitter<QuizState> emit) {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      final questions = currentState.quizResponse.results;
      final answers = currentState.selectedAnswers;

      int correctCount = 0;

      if (questions == null || questions.isEmpty) {
        emit(QuizError(errorMessage: "No questions available."));
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
        performanceMessage = "Excellent Performance! You're a Quiz Master! 🏆";
      } else if (percentage >= 75) {
        performanceMessage = "Great Job! Keep it up! 🎉";
      } else if (percentage >= 50) {
        performanceMessage = "Good effort! Try again to improve! 👍";
      } else {
        performanceMessage = "😢 Keep practicing! You'll get better!";
      }

      emit(QuizResult(
        correctAnswers: correctCount,
        totalQuestions: questions.length,
        performanceMessage: performanceMessage,
      ));
    }
  }
}
