import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Screen/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomePage(),
      title: "Hava Durumu",
      debugShowCheckedModeBanner: false,
    );
  }
}
