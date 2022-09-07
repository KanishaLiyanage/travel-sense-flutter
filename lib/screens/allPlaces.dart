import 'package:flutter/material.dart';

import '../models/backBtn.dart';

class AllPlacesScreen extends StatelessWidget {
  const AllPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 0.06 * size.width,
              right: 0.1 * size.width,
              top: 0.1 * size.height,
            ),
            child: Row(
              children: [
                BackBtn(),
                Container(
                  margin: EdgeInsets.only(
                    left: 0.04 * size.width,
                  ),
                  child: Text(
                    "All Places in Sri Lanka",
                    style: TextStyle(
                      color: Color(0xFF004581),
                      fontWeight: FontWeight.w500,
                      fontSize: 0.025 * size.height,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
