import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchQuiz extends QuizEvent {
  final int amount;
  final String type;

  FetchQuiz({this.amount = 10, this.type = "multiple"});

  @override
  List<Object?> get props => [amount, type];
}

class SelectAnswer extends QuizEvent {
  final int questionIndex;
  final String selectedAnswer;

  SelectAnswer({required this.questionIndex, required this.selectedAnswer});

  @override
  List<Object?> get props => [questionIndex, selectedAnswer];
}

class SubmitQuiz extends QuizEvent {}
