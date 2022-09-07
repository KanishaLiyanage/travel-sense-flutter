import 'package:flutter/material.dart';
import 'package:travel_sense/models/headerwithBack.dart';

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
          HeaderwithBackBtn(title: "All Places in Sri Lanka"),
        ],
      ),
    );
  }
}
