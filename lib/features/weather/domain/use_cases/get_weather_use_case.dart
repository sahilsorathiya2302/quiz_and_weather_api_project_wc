import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/weather_use_case.dart';
import 'package:quiz_api_project_wc/features/weather/domain/entities/weather_response.dart';
import 'package:quiz_api_project_wc/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase
    implements WeatherUseCase<WeatherResponse, WeatherParam> {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase({required this.weatherRepository});
  @override
  Future<Either<Failure, WeatherResponse>> call(WeatherParam param) {
    return weatherRepository.getWeather(param.city);
  }
}
