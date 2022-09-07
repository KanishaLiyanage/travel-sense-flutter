import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  String img_url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_gJgKaW8TSg8AB2aXASKRmVoBPDbvYPzinw&usqp=CAU";
  String title = "Yala National Park";

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
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(img_url),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(0.05 * size.width),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            title,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: Color(0xFFDDE8F0),
              fontWeight: FontWeight.w600,
              fontSize: 18,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 100.0,
                  color: Colors.black.withOpacity(1.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
