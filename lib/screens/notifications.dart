import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../services/weather.dart';
import '../models/customAppBar.dart';
import '../services/covid.dart';
import '../widgets/covidCard.dart';
import '../widgets/warningCard.dart';
import '../widgets/weatherCard.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var lon;
  var lat;
  var apiKey = "5f39ac098bfb1d20edb29bbc65746da8";
  var weatherData;
  var covidData;

  Dio dio = Dio();

  Future getWeather() async {
    WeatherAPIData weatherInfo = WeatherAPIData();
    await weatherInfo.getWeather();

    try {
      weatherData = weatherInfo.weatherData;
      return weatherData;
    } catch (e) {
      print(e);
    }
  }

  Future getCovid() async {
    CovidAPIData covidInfo = CovidAPIData();
    await covidInfo.getCovid();

    try {
      covidData = covidInfo.covidData;
      return covidData;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
    getCovid();
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
              WarningCard(),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              FutureBuilder(
                future: getWeather(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return WeatherCard(size, weatherData);
                  }
                },
              ),
              FutureBuilder(
                future: getCovid(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return CovidDataCard(
                      dateTime: covidData['data']['update_date_time'],
                      active: covidData['data']['local_active_cases'],
                      today: covidData['data']['local_new_cases'],
                      deaths: covidData['data']['local_new_deaths'],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
