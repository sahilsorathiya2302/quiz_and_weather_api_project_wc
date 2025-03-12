import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/features/quiz/data/data%20source/quiz_remote_data_source.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/repository/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  final QuizRemoteDataSource quizRemoteDataSource;

  QuizRepositoryImpl({required this.quizRemoteDataSource});

  @override
  Future<Either<Failure, QuizResponse>> fetchQuiz(
      int amount, String type) async {
    try {
      final response = await quizRemoteDataSource.getQuiz(amount, type);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
