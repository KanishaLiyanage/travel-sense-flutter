import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../services/location.dart';

class WeatherStatusScreen extends StatelessWidget {
  const WeatherStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
    );
  }
}
