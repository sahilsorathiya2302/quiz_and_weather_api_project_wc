import 'package:fpdart/fpdart.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/features/weather/domain/entities/weather_response.dart';
import 'package:quiz_api_project_wc/features/weather/domain/repositories/weather_repository.dart';

import '../data_source/weather_remote_data_source.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, WeatherResponse>> getWeather(String city) async {
    try {
      final response = await weatherRemoteDataSource.getWeather(city);
      return right(response);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
