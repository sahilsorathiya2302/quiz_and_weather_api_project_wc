import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';
import 'package:quiz_api_project_wc/features/city_pick/city_pick_screen.dart';
import 'package:quiz_api_project_wc/features/home/home_screen.dart';
import 'package:quiz_api_project_wc/features/quiz/presentation/quiz_screen.dart';
import 'package:quiz_api_project_wc/features/splash/splash_screen.dart';
import 'package:quiz_api_project_wc/features/weather/presentation/weather_screen.dart';

class AppRoutesPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutesName.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutesName.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutesName.quizScreen,
      page: () => QuizScreen(),
    ),
    GetPage(
      name: AppRoutesName.weatherScreen,
      page: () => WeatherScreen(),
    ),
    GetPage(
      name: AppRoutesName.cityPicker,
      page: () => CityPickScreen(),
    ),
  ];
}
