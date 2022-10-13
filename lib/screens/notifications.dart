import 'package:flutter/material.dart';

import '../models/customAppBar.dart';
import '../services/location.dart';

class NotificationsScreen extends StatelessWidget {
  var lon;
  var lat;

  Future getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    lat = location.latitude;
    lon = location.longitude;
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
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 0.3 * size.width,
                      width: 0.3 * size.width,
                      margin: EdgeInsets.all(0.04 * size.width),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 0.04 * size.width,
                        bottom: 0.04 * size.width,
                        right: 0.04 * size.width,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colombo",
                            style: TextStyle(
                              color: Color(0xFFDDE8F0),
                              fontWeight: FontWeight.w600,
                              fontSize: 0.035 * size.height,
                            ),
                          ),
                          Text(
                            "Heavy Rain",
                            style: TextStyle(
                              color: Color(0xFFDDE8F0),
                              fontWeight: FontWeight.w600,
                              fontSize: 0.025 * size.height,
                            ),
                          ),
                          Text(
                            "18 C",
                            style: TextStyle(
                              color: Color(0xFFDDE8F0),
                              fontWeight: FontWeight.w600,
                              fontSize: 0.025 * size.height,
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
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0.04 * size.width),
                height: 0.2 * size.height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
