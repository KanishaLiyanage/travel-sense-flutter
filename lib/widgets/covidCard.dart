import 'package:flutter/material.dart';

class CovidDataCard extends StatelessWidget {
  var dateTime;
  var active;
  var today;
  var deaths;

  CovidDataCard({
    required this.dateTime,
    required this.active,
    required this.today,
    required this.deaths,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(0.04 * size.width),
      padding: EdgeInsets.all(0.04 * size.width),
      height: 0.2 * size.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.red,
            child: Text(
              "Last Updated on: " + dateTime
                ..toString(),
              style: TextStyle(
                color: Color(0xFFDDE8F0),
                fontWeight: FontWeight.w600,
                fontSize: 0.03 * size.width,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    maxRadius: 0.085 * size.width,
                    backgroundColor: Colors.white,
                    child: Text(
                      active.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.05 * size.width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.015 * size.width),
                    child: Text(
                      "Active Cases",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.025 * size.width,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    maxRadius: 0.085 * size.width,
                    backgroundColor: Colors.white,
                    child: Text(
                      today.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.05 * size.width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.015 * size.width),
                    child: Text(
                      "Today Cases",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.025 * size.width,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    maxRadius: 0.085 * size.width,
                    backgroundColor: Colors.white,
                    child: Text(
                      deaths.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.05 * size.width,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0.015 * size.width),
                    child: Text(
                      "Today Deaths",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 0.025 * size.width,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
