import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {}

class FetchWeather extends WeatherEvent {
  final String city;

  FetchWeather({required this.city});
  @override
  List<Object?> get props => [city];
}
