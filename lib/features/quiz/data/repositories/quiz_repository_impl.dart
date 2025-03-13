import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/features/quiz/data/repositories/quiz_remote_repo.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/repository/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  final QuizRemoteRepo quizRemoteRepo;

  QuizRepositoryImpl({required this.quizRemoteRepo});

  @override
  Future<Either<Failure, QuizResponse>> getQuiz(int amount, String type) async {
    try {
      final response = await quizRemoteRepo.getQuiz(amount, type);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
