import 'dart:convert';
import 'package:weather_app/Models/WeatherData.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/WeatherDataCurrent.dart';
import 'package:weather_app/Models/WeatherDataDaily.dart';
import 'package:weather_app/Models/WeatherDataHourly.dart';
import 'package:weather_app/Utils/ApiURL.dart';


class FetchWeatherAPI
{
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async
  {
    var response = await http.get(Uri.parse(ApiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString)
    );
    return weatherData!;
  }
}