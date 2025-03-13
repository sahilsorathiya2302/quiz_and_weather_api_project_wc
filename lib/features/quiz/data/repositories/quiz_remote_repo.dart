import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/services/quiz_api_service.dart';

abstract interface class QuizRemoteRepo {
  Future<QuizResponse> getQuiz(int amount, String type);
}

class QuizRemoteRepoImpl extends QuizRemoteRepo {
  final QuizApiService quizApiService;

  QuizRemoteRepoImpl({required this.quizApiService});

  @override
  Future<QuizResponse> getQuiz(int amount, String type) async {
    return await quizApiService.getQuiz(amount, type);
  }
}
