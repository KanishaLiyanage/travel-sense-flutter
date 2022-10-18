import '../services/covid.dart';
import '../services/weather.dart';

class Warnings {
  var covid;
  var weather;
  var todayCases;
  var weatherCondition;
  var condId;
  var thunderCond;
  var warningStatus;

  Future<void> getAlerts() async {
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
        warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message":
              "It is too risky to travelling!, because there are 100+ Covid-19 active cases!"
        };
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
        warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "It is too risky to travelling!"
        };
      } else if ((condId == 300) ||
          (condId == 501) ||
          (condId == 611) ||
          (condId == 711) ||
          (condId == 762) ||
          (condId == 771)) {
        warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "Moderate risk, travel at your own risk."
        };
      } else if ((condId == 301) ||
          (condId == 500) ||
          (condId == 600) ||
          (condId == 601) ||
          (condId == 701) ||
          (condId == 761) ||
          (condId == 762) ||
          (condId == 721) ||
          (condId == 701)) {
        warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message":
              "Low risk, but be careful about the environmental changes."
        };
      } else {
        warningStatus = {
          "description": weatherCondition,
          "active_cases": todayCases,
          "warning_message": "It's safe for travelling"
        };
      }
    } catch (e) {
      print(e);
    }
  }
}
