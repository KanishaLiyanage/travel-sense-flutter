import 'package:flutter/material.dart';
import 'package:travel_sense/services/covid.dart';
import 'package:travel_sense/services/weather.dart';

class WarningCard extends StatefulWidget {
  @override
  State<WarningCard> createState() => _WarningCardState();
}

class _WarningCardState extends State<WarningCard> {
  var covid;

  var weather;

  var todayCases;

  var weatherCondition;

  var condId;

  var thunderCond;

  var warningStatus;

  Future getWarn() async {
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

      if (todayCases >= 100) {
        return warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message":
              "It is too risky to travelling!, because there are 100+ Covid-19 active cases!"
        };
        print(warningStatus);
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
        return warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "It is too risky to travelling!"
        };
        print(warningStatus);
      } else if ((condId == 300) ||
          (condId == 501) ||
          (condId == 611) ||
          (condId == 711) ||
          (condId == 762) ||
          (condId == 771)) {
        return warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "Moderate risk, Travel at your own risk."
        };
        print(warningStatus);
      } else if ((condId == 301) ||
          (condId == 500) ||
          (condId == 600) ||
          (condId == 601) ||
          (condId == 701) ||
          (condId == 761) ||
          (condId == 762) ||
          (condId == 721) ||
          (condId == 701)) {
        return warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "Low risk, but be careful about the environment."
        };
        print(warningStatus);
      } else {
        return warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "It's safe for travelling"
        };
        print(warningStatus);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getWarn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.04 * size.width),
            child: FutureBuilder(
              future: getWarn(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text(
                    warningStatus['description'] +
                        " & " +
                        warningStatus['active_cases'].toString() +
                        " active Covid-19 cases in today!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 0.05 * size.width,
                    ),
                  );
                }
              },
            ),
          ),
          FutureBuilder(
            future: getWarn(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04 * size.width),
                  child: Text(
                    warningStatus['warning_message'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 0.05 * size.width,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
      margin: EdgeInsets.all(0.04 * size.width),
      padding: EdgeInsets.all(0.05 * size.width),
      height: 0.3 * size.height,
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
