import 'package:flutter/material.dart';
import 'package:travel_sense/screens/placeInfo.dart';

class PlaceCardRect extends StatelessWidget {
  String img_url =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_gJgKaW8TSg8AB2aXASKRmVoBPDbvYPzinw&usqp=CAU";
  String title = "Yala National Park";
  String desc =
      "Yala (යාල) National Park is the most visited and second largest national park in Sri Lanka, bordering the Indian Ocean. The park consists of five blocks, two of which are now open to the public, and also adjoining parks. The blocks have individual names such as, Ruhuna National Park (Block 1), and Kumana National Park or 'Yala East' for the adjoining area. It is situated in the southeast region of the country, and lies in Southern Province and Uva Province. The park covers 979 square kilometres (378 sq mi) and is located about 300 kilometres (190 mi) from Colombo. Yala was designated as a wildlife sanctuary in 1900, and, along with Wilpattu was one of the first two national parks in Sri Lanka, having been designated in 1938. The park is best known for its variety of wild animals. It is important for the conservation of Sri Lankan elephants, Sri Lankan leopards and aquatic birds.";
  String prov = "Southern Province";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PlaceInfo(
            img: img_url,
            placeTitle: title,
            description: desc,
            province: prov,
          );
        }));
      },
      child: Container(
        margin: EdgeInsets.all(0.04 * size.width),
        height: 0.2 * size.height,
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
