import 'package:equatable/equatable.dart';

import '../../domain/entities/quiz_response.dart';

/// Base class for all quiz states.
abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the quiz is not yet loaded.
class QuizInitial extends QuizState {
  const QuizInitial();
}

/// State while quiz questions are being fetched.
class QuizLoading extends QuizState {
  const QuizLoading();
}

/// State when quiz questions are successfully loaded.
class QuizLoaded extends QuizState {
  final QuizResponse quizResponse;
  final Map<int, String> selectedAnswers;

  const QuizLoaded({required this.quizResponse, required this.selectedAnswers});

  @override
  List<Object?> get props => [quizResponse, selectedAnswers];
}

/// State when the quiz is submitted, and results are calculated.
class QuizResult extends QuizState {
  final int correctAnswers;
  final int totalQuestions;
  final String performanceMessage;

  const QuizResult({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.performanceMessage,
  });

  @override
  List<Object?> get props =>
      [correctAnswers, totalQuestions, performanceMessage];
}

/// State when an error occurs while fetching or processing the quiz.
class QuizError extends QuizState {
  final String errorMessage;

  const QuizError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
