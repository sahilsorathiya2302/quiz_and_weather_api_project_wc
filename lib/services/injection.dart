import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quiz_api_project_wc/core/usecase/use_case.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/repository/quiz_repository.dart';
import 'package:quiz_api_project_wc/features/quiz/domain/usecase/get_quiz_use_case.dart';
import 'package:quiz_api_project_wc/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_api_project_wc/features/weather/data/data_source/weather_remote_data_source.dart';
import 'package:quiz_api_project_wc/features/weather/domain/repositories/weather_repository.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:quiz_api_project_wc/services/quiz_api_service.dart';
import 'package:quiz_api_project_wc/services/weather_api_service.dart';

import '../core/constants/app_string.dart';
import '../features/quiz/data/data source/quiz_remote_data_source.dart';
import '../features/quiz/data/repositories/quiz_repository_impl.dart';
import '../features/weather/data/repositories/weather_repository_impl.dart';
import '../features/weather/domain/use_cases/get_weather_use_case.dart';

final getIt = GetIt.instance;

void init() {
  ///Quiz
  getIt.registerSingleton<Dio>(Dio(), instanceName: AppString.quiz);
  getIt.registerLazySingleton<QuizApiService>(
      () => QuizApiService(getIt<Dio>(instanceName: AppString.quiz)));
  getIt.registerLazySingleton<QuizRemoteDataSource>(
      () => QuizRemoteDataSourceImpl(quizApiService: getIt()));
  getIt.registerLazySingleton<QuizRepository>(
      () => QuizRepositoryImpl(quizRemoteDataSource: getIt()));

  getIt.registerLazySingleton<UseCase>(
      () => GetQuizUseCase(quizRepository: getIt()));
  getIt.registerFactory<QuizBloc>(() => QuizBloc(getIt()));

  ///Weather
  getIt.registerSingleton<Dio>(Dio(), instanceName: AppString.weather);

  getIt.registerLazySingleton<WeatherApiService>(
      () => WeatherApiService(getIt<Dio>(instanceName: AppString.weather)));

  getIt.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(weatherApiService: getIt()));

  getIt.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: getIt()));

  getIt.registerLazySingleton<GetWeatherUseCase>(
      () => GetWeatherUseCase(weatherRepository: getIt()));

  getIt.registerFactory<WeatherBloc>(
    () => WeatherBloc(getIt()),
  );
}
