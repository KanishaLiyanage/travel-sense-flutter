import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/customAppBar.dart';
import '../services/location.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var lon;
  var lat;
  var apiKey = "5f39ac098bfb1d20edb29bbc65746da8";
  var city;
  var temp;
  var cond;

  Dio dio = Dio();

  Future<void> getWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    lat = location.latitude;
    lon = location.longitude;
    print(lat);
    print(lon);
    var weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" +
        lat.toString() +
        "&lon=" +
        lon.toString() +
        "&appid=" +
        apiKey +
        "&units=metric";

    try {
      var getWeather = await dio.get('$weatherUrl');

      if (getWeather.statusCode == 200) {
        city = getWeather.data['name'];
        temp = getWeather.data['main']['temp'];
        cond = getWeather.data['weather'][0]['description'];
        print(city);
        print(temp);
        print(cond);
      } else {
        print("Server error!");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      appBar: CustomAppBar(
        size,
        title: "Notifications",
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 0.3 * size.width,
                      width: 0.3 * size.width,
                      margin: EdgeInsets.all(0.04 * size.width),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.04 * size.width,
                        bottom: 0.04 * size.width,
                        right: 0.04 * size.width,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colombo",
                            style: TextStyle(
                              color: Color(0xFFDDE8F0),
                              fontWeight: FontWeight.w600,
                              fontSize: 0.035 * size.height,
                            ),
                          ),
                          Text(
                            "Heavy Rain",
                            style: TextStyle(
                              color: Color(0xFFDDE8F0),
                              fontWeight: FontWeight.w600,
                              fontSize: 0.025 * size.height,
                            ),
                          ),
                          Text(
                            "18 C",
                            style: TextStyle(
                              color: Color(0xFFDDE8F0),
                              fontWeight: FontWeight.w600,
                              fontSize: 0.025 * size.height,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(0.04 * size.width),
                height: 0.2 * size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0.04 * size.width),
                height: 0.2 * size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
