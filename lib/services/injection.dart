import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_api_project_wc/services/weather_api_service.dart';

import '../feature/quiz/data/repository/quiz_remote.dart';
import '../feature/quiz/data/repository/quiz_repositories_impl.dart';
import '../feature/quiz/domain/usecase/use_case_impl.dart';
import '../feature/quiz/presentation/bloc/quiz_bloc.dart';
import '../feature/weather/data/repository/weather_remote.dart';
import '../feature/weather/data/repository/weather_repositories_impl.dart';
import '../feature/weather/domain/repository/weather_repositories.dart';
import '../feature/weather/domain/usecase/get_weather_use_case.dart';
import '../feature/weather/presentation/bloc/weather_bloc.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void init() {
  // Register Dio instances separately for Quiz and Weather APIs
  getIt.registerLazySingleton<Dio>(() => Dio(), instanceName: "Quiz");
  getIt.registerLazySingleton<Dio>(() => Dio(), instanceName: "Weather");

  // Quiz Dependencies
  getIt.registerLazySingleton<ApiServices>(
      () => ApiServices(getIt<Dio>(instanceName: "Quiz")));
  getIt.registerLazySingleton<QuizRemote>(
      () => QuizRemote(apiServices: getIt<ApiServices>()));
  getIt.registerLazySingleton<QuizRepositoriesImpl>(
      () => QuizRepositoriesImpl(quizRemote: getIt<QuizRemote>()));

  // UseCase should accept the repository interface, not the implementation
  getIt.registerLazySingleton<UseCaseImpl>(
      () => UseCaseImpl(quizRepositories: getIt<QuizRepositoriesImpl>()));

  getIt.registerLazySingleton<QuizBloc>(() => QuizBloc(getIt<UseCaseImpl>()));

  // Weather Dependencies
  getIt.registerLazySingleton<WeatherApiService>(
      () => WeatherApiService(getIt<Dio>(instanceName: "Weather")));

  getIt.registerLazySingleton<WeatherRemote>(
      () => WeatherRemote(weatherApiService: getIt<WeatherApiService>()));

  // 🔴 **Fix: Register the interface (`WeatherRepositories`) properly**
  getIt.registerLazySingleton<WeatherRepositories>(
      () => WeatherRepositoriesImpl(weatherRemote: getIt<WeatherRemote>()));

  getIt.registerLazySingleton<GetWeatherUseCase>(() =>
      GetWeatherUseCase(weatherRepositories: getIt<WeatherRepositories>()));

  getIt.registerLazySingleton<WeatherBloc>(
      () => WeatherBloc(getIt<GetWeatherUseCase>()));
}
