import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/quiz_use_case.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/repository/quiz_repository.dart';

class GetQuizUseCase implements QuizUseCase<QuizResponse, QuizParam> {
  final QuizRepository quizRepository;

  GetQuizUseCase({required this.quizRepository});
  @override
  Future<Either<Failure, QuizResponse>> call(QuizParam param) {
    return quizRepository.getQuiz(param.amount, param.type);
  }
}
