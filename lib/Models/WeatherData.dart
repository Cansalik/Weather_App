import 'package:weather_app/Models/WeatherDataCurrent.dart';
import 'package:weather_app/Models/WeatherDataDaily.dart';
import 'package:weather_app/Models/WeatherDataHourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  // function to fetch these values
  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
