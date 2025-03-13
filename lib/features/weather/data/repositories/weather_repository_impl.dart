import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/features/weather/data/repositories/weather_remote_repo.dart';
import 'package:quiz_api_project_wc/features/weather/domain/entities/weather_response.dart';
import 'package:quiz_api_project_wc/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteRepo weatherRemoteRepo;

  WeatherRepositoryImpl({required this.weatherRemoteRepo});

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(String city) async {
    try {
      final response = await weatherRemoteRepo.getWeather(city);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
