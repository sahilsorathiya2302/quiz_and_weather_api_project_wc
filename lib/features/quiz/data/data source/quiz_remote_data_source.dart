import 'package:quiz_api_project_wc/features/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/services/api_service.dart';

class QuizRemoteDataSource {
  final ApiService apiServices;

  QuizRemoteDataSource({required this.apiServices});

  Future<QuizResponse> getQuiz(int amount, String type) async {
    return await apiServices.fetchQuiz(amount, type);
  }
}
