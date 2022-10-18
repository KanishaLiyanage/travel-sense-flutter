import 'package:dio/dio.dart';

import 'location.dart';

class WeatherAPIData {
  var lat;
  var lon;
  var apiKey = "5f39ac098bfb1d20edb29bbc65746da8";
  var weatherData;

  Dio dio = Dio();

  Future<void> getWeather() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();

      // lat = location.latitude;
      // lon = location.longitude;

      lat = 7.465594251760848;
      lon = 80.04799206741393;

      var weatherUrl = "https://api.openweathermap.org/data/2.5/weather?lat=" +
          lat.toString() +
          "&lon=" +
          lon.toString() +
          "&appid=" +
          apiKey +
          "&units=metric";
      var getWeather = await dio.get('$weatherUrl');

      if (getWeather.statusCode == 200) {
        weatherData = getWeather.data;
      } else {
        print("Server error!");
      }
    } catch (e) {
      print(e);
    }
  }
}
