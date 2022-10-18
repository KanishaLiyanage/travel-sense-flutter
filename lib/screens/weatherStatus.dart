import 'package:flutter/material.dart';

import '../models/customAppBar.dart';

class WeatherStatusScreen extends StatelessWidget {
  const WeatherStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        size,
        title: "Weather Status",
      ),
      backgroundColor: Color(0xFFDDE8F0),
      body: Container(),
    );
  }
}
