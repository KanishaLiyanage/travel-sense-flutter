import 'dart:async';

import 'package:flutter/material.dart';

class WarningCard extends StatelessWidget {
  Function covidInfo;
  Function weatherInfo;

  WarningCard({
    required this.covidInfo,
    required this.weatherInfo,
  });

  Future warnMessage() async {
    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //var cond = weatherData['weather'][0]['description'];

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(0.04 * size.width),
            child: FutureBuilder(
                future: covidInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    ;
                  } else {
                    return Text(
                      "Heavy Thunderstom & Covid-19 100+ active cases in today!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.05 * size.width,
                      ),
                    );
                  }
                }),
          ),
          Container(
            margin: EdgeInsets.all(0.04 * size.width),
            child: FutureBuilder(
                future: weatherInfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
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
                    );
                  }
                }),
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
