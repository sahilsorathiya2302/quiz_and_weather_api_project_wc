import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quiz_api_project_wc/core/constants/api_string.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../features/weather/data/models/weather_model.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: ApiString.weatherBaseUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiString.weatherBaseUrl,
      contentType: ApiString.contentType,
      receiveTimeout: Duration(seconds: 30),
      connectTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30),
    );
    Dio dio = Dio(baseOptions);
    dio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true),
    );
    return _WeatherApiService(dio);
  }
  @GET("weather")
  Future<WeatherModel> getWeather(
    @Query("q") String city,
    @Query("appid") String apiKey,
    @Query("units") String units,
  );
}
