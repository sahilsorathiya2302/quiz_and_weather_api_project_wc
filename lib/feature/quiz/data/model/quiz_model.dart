import '../../domain/entities/quiz_response.dart';
import '../../domain/entities/results.dart';

class QuizModel extends QuizResponse {
  QuizModel({super.responseCode, super.results});
  QuizModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }
}
