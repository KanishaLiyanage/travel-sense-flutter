import 'package:flutter/material.dart';

import '../widgets/placeCardRect.dart';
import '../models/headerwithBack.dart';

class AroundYouScreen extends StatelessWidget {
  const AroundYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      appBar: AppBar(
        toolbarHeight: 0.12 * size.height,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: HeaderwithBackBtn(title: "Places Around You"),
      ),
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
      // body: Column(
      //   children: [
      //     HeaderwithBackBtn(title: "Places Around You"),
      //   ],
      // ),
    );
  }
}
