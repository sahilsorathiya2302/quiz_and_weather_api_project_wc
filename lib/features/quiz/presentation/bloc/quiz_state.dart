import 'package:equatable/equatable.dart';

import '../../domain/entities/quiz_response.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {
  const QuizInitial();
}

class QuizLoading extends QuizState {
  const QuizLoading();
}

class QuizLoaded extends QuizState {
  final QuizResponse quizResponse;
  final int? currentIndex;
  final Map<int, String> selectedAnswers;

  const QuizLoaded(this.currentIndex,
      {required this.quizResponse, required this.selectedAnswers});

  @override
  List<Object?> get props => [quizResponse, selectedAnswers];
}

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

class QuizError extends QuizState {
  final String errorMessage;

  const QuizError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
