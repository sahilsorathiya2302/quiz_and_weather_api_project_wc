import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/services/quiz_api_service.dart';

class QuizRemoteDataSource {
  final QuizApiService quizApiService;

  QuizRemoteDataSource({required this.quizApiService});

  Future<QuizResponse> getQuiz(int amount, String type) async {
    return await quizApiService.getQuiz(amount, type);
  }
}
