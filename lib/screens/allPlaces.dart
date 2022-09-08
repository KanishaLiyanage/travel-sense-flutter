import 'package:flutter/material.dart';

import '../models/customAppBar.dart';
import '../widgets/placeCardRect.dart';

class AllPlacesScreen extends StatelessWidget {
  var placesList;
  final Function getAllPlaces;

  AllPlacesScreen({
    required this.placesList,
    required this.getAllPlaces,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(size, title: "All Places in Sri Lanka"),
      backgroundColor: Color(0xFFDDE8F0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.015 * size.height),
        // implement GridView.builder
        child: FutureBuilder(
          future: getAllPlaces(),
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
