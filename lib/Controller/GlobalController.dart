import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/Api/FetchWeatherAPI.dart';
import 'package:weather_app/Models/WeatherData.dart';

class GlobalController extends GetxController
{
  //Variables are defined here.
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt _currentIndex = 0.obs;

  //To answer calls
  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongitude() => _longitude;

  final weatherData = WeatherData().obs;

  WeatherData getData() {
    return weatherData.value;
  }
  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
    super.onInit();
  }


  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();


    // Status of permission
    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever)
    {
      return Future.error("Location permission are denied forever");
    }
    else if (locationPermission == LocationPermission.denied)
    {
      // request permission
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied)
      {
        return Future.error("Location permission is denied");
      }
    }

    // getting the currentposition
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      // update our lattitude and longitude
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
      // calling our weather api
      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });
    });
  }
  RxInt getIndex() {
    return _currentIndex;
  }
}