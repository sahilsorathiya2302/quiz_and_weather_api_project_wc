import 'package:quiz_api_project_wc/feature/weather/domain/entities/coord.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/sys.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/w_main.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/weather.dart';
import 'package:quiz_api_project_wc/feature/weather/domain/entities/wind.dart';

class WeatherResponse {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Clouds? clouds;
  int? dt;
  Sys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  WeatherResponse(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});
}
