import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failure/failure.dart';
import 'package:quiz_api_project_wc/feature/weather/data/repository/weather_remote.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/weather_response.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/repository/weather_repositories.dart';

class WeatherRepositoriesImpl extends WeatherRepositories {
  final WeatherRemote weatherRemote;

  WeatherRepositoriesImpl({required this.weatherRemote});

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(String city) async {
    try {
      final response = await weatherRemote.getWeather(city);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
