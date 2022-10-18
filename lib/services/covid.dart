import 'package:dio/dio.dart';

class CovidAPIData {
  var covidData;
  Dio dio = Dio();

  Future<void> getCovid() async {
    var covidUrl = "https://www.hpb.health.gov.lk/api/get-current-statistical";

    try {
      var getCovidData = await dio.get('$covidUrl');

      if (getCovidData.statusCode == 200) {
        covidData = getCovidData.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
