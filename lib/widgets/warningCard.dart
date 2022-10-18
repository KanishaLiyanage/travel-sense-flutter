import 'package:flutter/material.dart';
import 'package:travel_sense/services/covid.dart';
import 'package:travel_sense/services/weather.dart';

class WarningCard extends StatelessWidget {
  var covid;
  var weather;
  var todayCases;
  var weatherCondition;
  var warningMsg;
  var condId;
  var thunderCond;

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
      condId = weather['weather'][0]['id'];
      thunderCond = (condId / 100).toInt();
      // condId = 299;
      print(todayCases);
      print("cond ID: " + condId.toString());
      print("desc: " + weatherCondition.toString());

      if (todayCases >= 100) {
        warningMsg = "It is too risky to travelling!";
        print(warningMsg);
      } else if ((2 == thunderCond) ||
          (condId == 302) ||
          (condId == 310) ||
          (condId == 311) ||
          (condId == 312) ||
          (condId == 313) ||
          (condId == 314) ||
          (condId == 321) ||
          (condId == 502) ||
          (condId == 503) ||
          (condId == 504) ||
          (condId == 511) ||
          (condId == 520) ||
          (condId == 521) ||
          (condId == 522) ||
          (condId == 531) ||
          (condId == 602) ||
          (condId == 612) ||
          (condId == 613) ||
          (condId == 615) ||
          (condId == 616) ||
          (condId == 620) ||
          (condId == 621) ||
          (condId == 622) ||
          (condId == 741) ||
          (condId == 731) ||
          (condId == 751) ||
          (condId == 781)) {
        warningMsg = "It is too risky to travelling!";
        print(warningMsg);
      } else if ((condId == 300) ||
          (condId == 501) ||
          (condId == 611) ||
          (condId == 711) ||
          (condId == 762) ||
          (condId == 771)) {
        warningMsg = "Moderate risk, Travel at your own risk.";
        print(warningMsg);
      } else if ((condId == 301) ||
          (condId == 500) ||
          (condId == 600) ||
          (condId == 601) ||
          (condId == 701) ||
          (condId == 761) ||
          (condId == 762) ||
          (condId == 721) ||
          (condId == 701)) {
        warningMsg = "Low risk, but be careful about the environment.";
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
