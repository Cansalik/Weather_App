import 'package:weather_app/Api/ApiKey.dart';

String ApiURL(var lat, var lon)
{
  String url;
  url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$ApiKey&units=metric&exclude=minutely";
  return url;
}