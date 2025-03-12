import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/feature/quiz/domain/repository/quiz_repository.dart';

class UseCaseImpl implements UseCase<QuizResponse, QuizParam> {
  final QuizRepository quizRepository;

  UseCaseImpl({required this.quizRepository});
  @override
  Future<Either<Failure, QuizResponse>> call(QuizParam param) {
    return quizRepository.fetchQuiz(param.amount, param.type);
  }
}
