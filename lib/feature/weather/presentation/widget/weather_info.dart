import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quiz_api_project_wc/core/constraints/app_string.dart';

class WeatherInfo extends StatefulWidget {
  final dynamic state;

  const WeatherInfo({super.key, this.state});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // City Name & Country
        Text(
          "${widget.state.weatherResponse.name}, ${widget.state.weatherResponse.sys?.country.toString()}",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 10),

        // Weather Icon
        Image.network(
          'https://openweathermap.org/img/wn/${widget.state.weatherResponse.weather?[0].icon}@2x.png',
          width: 100,
        ),

        // Temperature
        Text(
          '${widget.state.weatherResponse.main?.tempMin ?? 0}°C',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),

        // Weather Description
        Text(
          widget.state.weatherResponse.weather?[0].description ?? "",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),

        SizedBox(height: 20),

        // Additional Weather Info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _weatherInfo(Icons.water_drop, AppString.humidity,
                "${widget.state.weatherResponse.main?.humidity ?? 12}%"),
            _weatherInfo(Icons.air, AppString.wind,
                "${widget.state.weatherResponse.wind?.speed ?? 0} m/s"),
            _weatherInfo(Icons.speed, AppString.pressure,
                "${widget.state.weatherResponse.main?.pressure ?? ""} hPa"),
          ],
        ),

        SizedBox(height: 20),

        // Sunrise & Sunset
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _weatherInfo(Icons.wb_sunny, AppString.sunrise,
                _formatTime(widget.state.weatherResponse.sys!.sunrise ?? 0)),
            _weatherInfo(Icons.nights_stay, AppString.sunset,
                _formatTime(widget.state.weatherResponse.sys!.sunset ?? 0)),
          ],
        ),
      ],
    );
  }

  // Function to format timestamp into readable time
  String _formatTime(int timestamp) {
    return DateFormat.jm()
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
  }

  Widget _weatherInfo(IconData icon, String title, String value) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 5),
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}
