import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Controller/GlobalController.dart';
import 'package:weather_app/Utils/CustomColors.dart';
import 'package:weather_app/Widgets/ComfortLevel.dart';
import 'package:weather_app/Widgets/CurrentWeatherWidget.dart';
import 'package:weather_app/Widgets/DailyWeatherForecast.dart';
import 'package:weather_app/Widgets/HeadetWidget.dart';
import 'package:weather_app/Widgets/HourlyWeatherWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(()=>globalController.checkLoading().isTrue ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/clouds.png",
                height: 200,
                width: 200,
              ),
              const CircularProgressIndicator()
            ],
          ),
        )
            : Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children:  [
              const SizedBox(height: 20,),
              const HeaderWidget(),
              CurrentWeatherWidget(weatherDataCurrent: globalController.getData().getCurrentWeather(),),
              const SizedBox(height: 20,),
              HourlyWeatherWidget(weatherDataHourly: globalController.getData().getHourlyWeather()),
              const SizedBox(height: 20,),
              DailyWeatherForecast(weatherDataDaily: globalController.getData().getDailyWeather(),),
              Container(height: 1,color: CustomColors.dividerLine,),
              const SizedBox(height: 10,),
              ComfortLevel(weatherDataCurrent: globalController.getData().getCurrentWeather(),),
            ],
          ),
        )),
      ),
    );
  }
}
