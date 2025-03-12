import 'package:flutter/material.dart';
import 'package:quiz_api_project_wc/feature/home/widget/start_button.dart';
import 'package:quiz_api_project_wc/feature/home/widget/weather_button.dart';

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
          Center(child: StartButton()),
          WeatherButton(),
        ],
      ),
    );
  }
}
