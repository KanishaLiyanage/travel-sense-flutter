import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import '../widgets/placeCard.dart';
import '../widgets/categoryBtn.dart';
import '../widgets/searchBar.dart';
import '../widgets/weatherStatus.dart';
import '../widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var url = "";
  var items = [];

  Dio dio = Dio();

  Future<void> getData() async {
    try {
      var response = await dio.get('$url/user/home');
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      body: Column(
        children: [
          Header(),
          SizedBox(height: 0.04 * size.height),
          WeatherStatusCard(),
          SizedBox(height: 0.04 * size.height),
          SearchBar(),
          SizedBox(height: 0.01 * size.height),
          Container(
            height: 0.55 * size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 0.03 * size.height),
                  CategoryButtons(title: "Around You"),
                  Container(
                    padding: EdgeInsets.all(0.03 * size.width),
                    height: 0.45 * size.height,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return PlaceCard();
                      },
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  CategoryButtons(title: "All Places"),
                  Container(
                    padding: EdgeInsets.all(0.03 * size.width),
                    height: 0.45 * size.height,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return PlaceCard();
                      },
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  //SizedBox(height: 0.03 * size.height),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
