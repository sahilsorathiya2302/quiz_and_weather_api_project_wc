import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';
import 'package:quiz_api_project_wc/features/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/bloc/weather_event.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/bloc/weather_state.dart';

import '../../domain/entities/weather_response.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoadingState());

      final result =
          await getWeatherUseCase.call(WeatherParam(city: event.city));

      result.fold(
        (Failure error) => emit(WeatherErrorState(errorMessage: error.message)),
        (WeatherResponse weather) =>
            emit(WeatherLoadedState(weatherResponse: weather)),
      );
    });
  }
}
