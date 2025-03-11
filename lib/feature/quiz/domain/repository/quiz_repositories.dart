import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failure/failure.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/entities/quiz_response.dart';

abstract class QuizRepositories {
  Future<Either<Failure, QuizResponse>> fetchQuiz(int amount, String type);
}
