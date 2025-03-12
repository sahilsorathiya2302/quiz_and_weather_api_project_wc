import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';

abstract class QuizRepository {
  Future<Either<Failure, QuizResponse>> fetchQuiz(int amount, String type);
}
