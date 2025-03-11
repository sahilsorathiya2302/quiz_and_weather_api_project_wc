import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failure/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/weather_response.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/repository/weather_repositories.dart';

class GetWeatherUseCase implements UseCase<WeatherResponse, WeatherParam> {
  final WeatherRepositories weatherRepositories;

  GetWeatherUseCase({required this.weatherRepositories});
  @override
  Future<Either<Failure, WeatherResponse>> call(WeatherParam param) {
    return weatherRepositories.getWeather(param.city);
  }
}
