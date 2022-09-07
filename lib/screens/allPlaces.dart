import 'package:flutter/material.dart';

import '../models/customAppBar.dart';
import '../widgets/placeCardRect.dart';

class AllPlacesScreen extends StatelessWidget {
  const AllPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(size, title: "All Places in Sri Lanka"),
      backgroundColor: Color(0xFFDDE8F0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.015 * size.height),
        // implement GridView.builder
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return PlaceCardRect();
          },
        ),
      ),
    );
  }
}
