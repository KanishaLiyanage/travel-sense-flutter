import 'package:flutter/material.dart';
import 'package:travel_sense/screens/placeInfo.dart';

class PlaceCardSqr extends StatelessWidget {
  String name;
  String img_url;
  String prov;
  String desc;

  PlaceCardSqr({
    required this.name,
    required this.img_url,
    required this.prov,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return PlaceInfo(
                img: img_url,
                placeTitle: name,
                description: desc,
                province: prov,
              );
            },
          ),
        );
      },
      child: Container(
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
              name,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Color(0xFFDDE8F0),
                fontWeight: FontWeight.w600,
                fontSize: 0.035 * size.height,
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
      ),
    );
  }
}
