import 'package:equatable/equatable.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/weather_response.dart';

sealed class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherResponse weatherResponse;

  WeatherLoadedState({required this.weatherResponse});

  @override
  List<Object?> get props => [weatherResponse];
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
