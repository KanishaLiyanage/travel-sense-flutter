import 'package:flutter/material.dart';

class WeatherStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            //weather status
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 0.1 * size.width,
                  right: 0.1 * size.width,
                ),
                child: Text(
                  "Discover",
                  style: TextStyle(
                    color: Color(0xFF004581),
                    fontWeight: FontWeight.w600,
                    fontSize: 0.035 * size.height,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 0.1 * size.width,
                  right: 0.1 * size.width,
                ),
                child: Text(
                  "Sri Lanka with us!",
                  style: TextStyle(
                    color: Color(0xFF004581),
                    fontWeight: FontWeight.w600,
                    fontSize: 0.035 * size.height,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
