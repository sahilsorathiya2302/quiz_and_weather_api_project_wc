import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failure/failure.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/weather_response.dart';

abstract class WeatherRepositories {
  Future<Either<Failure, WeatherResponse>> getWeather(String city);
}
