import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_api_project_wc/core/constants/app_string.dart';
import 'package:quiz_api_project_wc/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:quiz_api_project_wc/features/weather/domain/repositories/weather_repository.dart';
import 'package:quiz_api_project_wc/features/weather/domain/use_cases/get_weather_use_case.dart';
import 'package:quiz_api_project_wc/services/weather_api_service.dart';

import '../features/quiz/data/data source/quiz_remote_data_source.dart';
import '../features/quiz/data/repositories/quiz_repository_impl.dart';
import '../features/quiz/domain/usecase/use_case_impl.dart';
import '../features/quiz/presentation/bloc/quiz_bloc.dart';
import '../features/weather/data/data_source/weather_remote_data_source.dart';
import '../features/weather/presentation/bloc/weather_bloc.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<Dio>(() => Dio(), instanceName: AppString.quiz);
  getIt.registerLazySingleton<Dio>(() => Dio(),
      instanceName: AppString.weather);

  getIt.registerLazySingleton<ApiService>(
      () => ApiService(getIt<Dio>(instanceName: AppString.quiz)));
  getIt.registerLazySingleton<QuizRemoteDataSource>(
      () => QuizRemoteDataSource(apiServices: getIt<ApiService>()));
  // getIt.registerLazySingleton<QuizRepositoriesImpl>(
  //     () => QuizRepositoriesImpl(quizRemote: getIt<QuizRemote>()));

  getIt.registerLazySingleton<UseCaseImpl>(
      () => UseCaseImpl(quizRepository: getIt<QuizRepositoryImpl>()));

  getIt.registerLazySingleton<QuizBloc>(() => QuizBloc(getIt<UseCaseImpl>()));

  getIt.registerLazySingleton<WeatherApiService>(
      () => WeatherApiService(getIt<Dio>(instanceName: AppString.weather)));

  getIt.registerLazySingleton<WeatherRemoteDataSource>(() =>
      WeatherRemoteDataSource(weatherApiService: getIt<WeatherApiService>()));

  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
      weatherRemoteDataSource: getIt<WeatherRemoteDataSource>()));

  getIt.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(weatherRepository: getIt()));

  getIt.registerLazySingleton<WeatherBloc>(
      () => WeatherBloc(getIt<GetWeatherUseCase>()));
}
