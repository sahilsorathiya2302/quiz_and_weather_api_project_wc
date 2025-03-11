import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failure/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/repository/quiz_repositories.dart';

class UseCaseImpl implements UseCase<QuizResponse, QuizParam> {
  final QuizRepositories quizRepositories;

  UseCaseImpl({required this.quizRepositories});
  @override
  Future<Either<Failure, QuizResponse>> call(QuizParam param) {
    return quizRepositories.fetchQuiz(param.amount, param.type);
  }
}
