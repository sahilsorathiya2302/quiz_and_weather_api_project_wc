import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/routes/app_routes_name.dart';
import 'package:quiz_api_project_wc/feature/city_pick/city_pick_screen.dart';
import 'package:quiz_api_project_wc/feature/home/home_screen.dart';
import 'package:quiz_api_project_wc/feature/quiz/presentation/quiz_screen.dart';
import 'package:quiz_api_project_wc/feature/splash/splash_screen.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/weather_screen.dart';

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
