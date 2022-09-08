import 'package:flutter/material.dart';

import '../models/customAppBar.dart';
import '../widgets/placeCardRect.dart';

class AroundYouScreen extends StatelessWidget {
  var placesList;
  final Function getAroundPlaces;

  AroundYouScreen({
    required this.placesList,
    required this.getAroundPlaces,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      appBar: CustomAppBar(size, title: "Places Around You"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.015 * size.height),
        child: FutureBuilder(
          future: getAroundPlaces(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return PlaceCardRect(
                    name: placesList[index]['name'],
                    img_url: placesList[index]['image'],
                    district: placesList[index]['district'],
                    desc: placesList[index]['description'],
                  );
                },
                itemCount: placesList.length,
              );
            }
          },
        ),
      ),
    );
  }
}
