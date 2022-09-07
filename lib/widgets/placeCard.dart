import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(0.04 * size.width),
      height: 0.35 * size.height,
      width: 0.55 * size.width,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
