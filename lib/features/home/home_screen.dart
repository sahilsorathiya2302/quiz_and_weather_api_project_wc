import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/features/home/widget/logo_widget.dart';
import 'package:quiz_api_project_wc/features/home/widget/quiz_button.dart';
import 'package:quiz_api_project_wc/features/home/widget/weather_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LogoWidget(),
          Center(child: QuizButton()),
          WeatherButton(),
        ],
      ),
    );
  }
}
