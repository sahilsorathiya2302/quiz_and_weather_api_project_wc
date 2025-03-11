import 'package:quiz_api_project_wc/feature/quiz/domain/entities/results.dart';

class QuizResponse {
  int? responseCode;
  List<Results>? results;

  QuizResponse({
    this.responseCode,
    this.results,
  });
}

class Question {
  final String question; // The text of the question
  final List<String> options; // List of options for the question
  final String correctAnswer; // The correct answer

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}
