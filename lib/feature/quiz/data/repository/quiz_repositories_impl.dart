import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failure/failure.dart';
import 'package:quiz_api_project_wc/feature/quiz/data/repository/quiz_remote.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/repository/quiz_repositories.dart';

class QuizRepositoriesImpl extends QuizRepositories {
  final QuizRemote quizRemote;

  QuizRepositoriesImpl({required this.quizRemote});

  @override
  Future<Either<Failure, QuizResponse>> fetchQuiz(
      int amount, String type) async {
    try {
      final response = await quizRemote.getQuiz(amount, type);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
