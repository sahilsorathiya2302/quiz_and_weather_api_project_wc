import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/bloc/weather_event.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/bloc/weather_state.dart';

import '../../domain/entities/weather_response.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoadingState()); // Emit loading state

      final result = await getWeatherUseCase
          .call(WeatherParam(city: event.city)); // Pass city parameter

      result.fold(
        (Failure error) => emit(
            WeatherErrorState(errorMessage: error.message)), // Handle error
        (WeatherResponse weather) => emit(
            WeatherLoadedState(weatherResponse: weather)), // Handle success
      );
    });
  }
}
