import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quiz_api_project_wc/core/component/custom_app_bar.dart';
import 'package:quiz_api_project_wc/core/component/custom_text.dart';
import 'package:quiz_api_project_wc/core/constraints/app_string.dart';
import 'package:quiz_api_project_wc/core/theme/app_colors.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/bloc/weather_bloc.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/bloc/weather_event.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/bloc/weather_state.dart';
import 'package:quiz_api_project_wc/feature/weather/presentation/widget/weather_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    final arguments = Get.arguments;
    final city = arguments[AppString.argumentKey];
    BlocProvider.of<WeatherBloc>(context).add(FetchWeather(city: city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        bgColor: AppColors.blueAccent,
        text: AppString.weather,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.blueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoadedState) {
              return WeatherInfo(
                state: state,
              );
            }

            return Center(
              child: CustomText(
                text: AppString.weatherError,
              ),
            );
          },
        ),
      ),
    );
  }
}
