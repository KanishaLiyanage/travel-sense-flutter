import 'package:flutter/material.dart';

import '../models/backButton.dart';

class PlaceInfo extends StatelessWidget {
  String img;
  String placeTitle;
  String description;
  String district;

  PlaceInfo({
    required this.img,
    required this.placeTitle,
    required this.description,
    required this.district,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 0.43 * size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(img),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 0.06 * size.width,
                  right: 0.1 * size.width,
                  top: 0.1 * size.height,
                ),
                child: Row(
                  children: [
                    BackBtn(),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              left: 0.06 * size.width,
              right: 0.1 * size.width,
              top: 0.05 * size.height,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    placeTitle,
                    style: TextStyle(
                      color: Color(0xFF004581),
                      fontWeight: FontWeight.w600,
                      fontSize: 0.065 * size.width,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border_rounded,
                    color: Color(0xFF018ABD),
                    size: 0.04 * size.height,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 0.06 * size.width,
              right: 0.1 * size.width,
              top: 0.01 * size.height,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 0.02 * size.width,
                  ),
                  child: Icon(
                    Icons.location_pin,
                    color: Color(0xFF018ABD),
                    size: 0.025 * size.height,
                  ),
                ),
                Text(
                  district,
                  style: TextStyle(
                    color: Color(0xFF1A2239),
                    fontWeight: FontWeight.w400,
                    fontSize: 0.016 * size.height,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 0.06 * size.width,
              right: 0.1 * size.width,
              top: 0.03 * size.height,
            ),
            child: Row(
              children: [
                Text(
                  "About this place",
                  style: TextStyle(
                    color: Color(0xFF1A2239),
                    fontWeight: FontWeight.w500,
                    fontSize: 0.022 * size.height,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.3 * size.height,
            margin: EdgeInsets.only(
              left: 0.06 * size.width,
              right: 0.1 * size.width,
              top: 0.015 * size.height,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.015 * size.height),
                child: Text(
                  description,
                  style: TextStyle(
                    color: Color(0xFF1A2239),
                    fontWeight: FontWeight.w200,
                    fontSize: 0.015 * size.height,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
