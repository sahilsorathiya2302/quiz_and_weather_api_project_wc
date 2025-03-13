import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_api_project_wc/core/failures/failure.dart';
import 'package:quiz_api_project_wc/core/usecase/weather_use_case.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/bloc/weather_event.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherUseCase weatherUseCase;

  WeatherBloc(this.weatherUseCase) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherLoadingState());

      final result = await weatherUseCase.call(WeatherParam(city: event.city));

      result.fold(
        (Failure error) => emit(WeatherErrorState(errorMessage: error.message)),
        (weather) => emit(WeatherLoadedState(weatherResponse: weather)),
      );
    });
  }
}
