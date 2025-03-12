import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/features/weather/domain/entities/weather_response.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherResponse>> getWeather(String city);
}
