import 'package:quiz_api_project_wc/feature/quiz/domain/entities/quiz_response.dart';
import 'package:quiz_api_project_wc/services/api_services.dart';

class QuizRemote {
  final ApiServices apiServices;

  QuizRemote({required this.apiServices});

  Future<QuizResponse> getQuiz(int amount, String type) async {
    return await apiServices.fetchQuiz(amount, type);
  }
}
