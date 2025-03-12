import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz_api_project_wc/core/secret/api_end_point.dart';
import 'package:quiz_api_project_wc/core/secret/api_string.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../features/quiz/data/models/quiz_model.dart';

part 'quiz_api_service.g.dart';

@RestApi(baseUrl: ApiString.quizBaseUrl)
abstract class QuizApiService {
  factory QuizApiService(
    Dio dio,
  ) {
    dio.options = BaseOptions(
      baseUrl: ApiString.quizBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: ApiString.contentType,
    );

    // Add logging interceptor (only in debug mode)
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );

    return _QuizApiService(dio);
  }

  @GET(ApiEndPoint.getQuiz)
  Future<QuizModel> getQuiz(
    @Query("amount") int amount,
    @Query("type") String type,
  );
}
