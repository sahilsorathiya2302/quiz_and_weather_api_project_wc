import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_pages.dart';
import 'package:quiz_api_project_wc/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:quiz_api_project_wc/services/injection.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<QuizBloc>(
            create: (context) => getIt<QuizBloc>(),
          ),
          BlocProvider<WeatherBloc>(
            create: (context) => getIt<WeatherBloc>(),
          ),
        ],
        child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: "/",
          getPages: AppRoutesPages.pages,
        ),
      ),
    );
  }
}
