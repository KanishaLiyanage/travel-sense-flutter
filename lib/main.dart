import 'package:flutter/material.dart';

import 'screens/landing.dart';
import './screens/home.dart';
import './screens/allPlaces.dart';
import './screens/aroundYou.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: LandingScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/aroundU': (context) => AroundYouScreen(),
        '/allPlaces': (context) => AllPlacesScreen(),
      },
    );
  }
}
