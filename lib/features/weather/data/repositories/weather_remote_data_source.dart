import 'package:quiz_api_project_wc/features/weather/domain/entities/weather_response.dart';
import 'package:quiz_api_project_wc/services/weather_api_service.dart';

abstract interface class WeatherRemoteDataSource {
  Future<WeatherResponse> getWeather(String city);
}

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final WeatherApiService weatherApiService;

  WeatherRemoteDataSourceImpl({required this.weatherApiService});

  @override
  Future<WeatherResponse> getWeather(String city) {
    return weatherApiService.getWeather(
      city,
      "c1ba427d782b2e6e74355552f4fb88a6",
      "metric",
    );
  }
}
