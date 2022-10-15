import 'package:flutter/material.dart';

Container WeatherCard(Size size, weatherData) {
  var city = weatherData['name'];
  var temp = weatherData['main']['temp'];
  var cond = weatherData['weather'][0]['description'];
  var icon = weatherData['weather'][0]['icon'];
  var iconUrl = "http://openweathermap.org/img/wn/" + icon + "@2x.png";
  //risky weather cond: 09,19,11,13

  return Container(
    child: Row(
      children: [
        Container(
          height: 0.3 * size.width,
          width: 0.3 * size.width,
          margin: EdgeInsets.all(0.035 * size.width),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('$iconUrl'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 0.08 * size.width,
            bottom: 0.04 * size.width,
            right: 0.04 * size.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  city,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 0.06 * size.width,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  cond,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 0.045 * size.width,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  temp.toString() + " °C",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 0.04 * size.width,
                  ),
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
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
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
