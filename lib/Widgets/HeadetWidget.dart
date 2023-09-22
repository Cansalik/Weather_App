import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Controller/GlobalController.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat('yMMMd').format(DateTime.now());

  final GlobalController globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async
  {
    List<Placemark> placemark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.administrativeArea!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: TextStyle(fontSize: 35,height: 2),),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20,bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(color: Colors.grey[700],fontSize: 14,height: 1.5),),
        ),
      ],
    );
  }
}
