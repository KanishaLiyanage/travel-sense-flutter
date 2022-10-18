import 'package:flutter/material.dart';
import 'package:travel_sense/services/covid.dart';
import 'package:travel_sense/services/weather.dart';

class WarningCard extends StatelessWidget {
  var covid;
  var weather;
  var todayCases;
  var weatherCondition;
  var warningMsg;

  Future<void> getWarn() async {
    try {
      CovidAPIData covidInfo = CovidAPIData();
      await covidInfo.getCovid();

      WeatherAPIData weatherInfo = WeatherAPIData();
      await weatherInfo.getWeather();

      covid = covidInfo.covidData;
      weather = weatherInfo.weatherData;

      todayCases = covid['data']['local_new_cases'];
      weatherCondition = weather['weather'][0]['description'];

      print(todayCases);
      print(weatherCondition);

      if (todayCases >= 100 && weatherCondition == "overcast clouds") {
        warningMsg = "It is too risky to travelling!";
        print(warningMsg);
      } else {
        warningMsg = "It's safe for travelling";
        print(warningMsg);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(0.04 * size.width),
            child: Text(
              "Heavy Thunderstom & Covid-19 100+ active cases in today!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 0.05 * size.width,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(0.04 * size.width),
            child: Text(
              "It is too risky to travelling!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 0.05 * size.width,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ElevatedButton(
            onPressed: getWarn,
            child: Text("get"),
          ),
        ],
      ),
      margin: EdgeInsets.all(0.04 * size.width),
      padding: EdgeInsets.all(0.05 * size.width),
      // height: 0.3 * size.height,
      height: 0.5 * size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
