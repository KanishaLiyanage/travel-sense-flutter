import 'package:flutter/material.dart';

import 'package:travel_sense/screens/allPlaces.dart';

class CategoryBtnAllPlaces extends StatelessWidget {
  String title;
  var placesList;

  CategoryBtnAllPlaces({
    required this.title,
    required this.placesList,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 0.1 * size.width,
        right: 0.1 * size.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //width: 0.25 * size.width,
            padding: EdgeInsets.all(0.01 * size.height),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 0.013 * size.height,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF018ABD),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AllPlacesScreen(
                      placesList: placesList,
                    );
                  },
                ),
              );
            },
            child: Text(
              "View more",
              style: TextStyle(
                fontSize: 0.015 * size.height,
                color: Color(0xFF018ABD),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
