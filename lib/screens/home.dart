import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widgets/catBtnAllPlaces.dart';
import '../widgets/catBtnAroundU.dart';
import '../widgets/placeCardSqr.dart';
import '../widgets/searchBar.dart';
import '../widgets/weatherStatus.dart';
import '../widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var url = "https://travel-sense-app-rest-api.herokuapp.com";
  var placesList = [];
  var place = {};

  Dio dio = Dio();

  Future<void> getData() async {
    try {
      var response = await dio.get('$url/user/home');
      placesList = response.data;
      //var placesListLength = (placesList.length).toString();
      //print(placesList[1]);
      // print("Items Length is: " + placesListLength);
      // place = placesList[1];
      // print(place);
      // print(place['name']);
      print('button clicked!');
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
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
          SizedBox(height: 0.02 * size.height),
          Container(
            height: 0.52 * size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 0.02 * size.height),
                  CategoryBtnAroundU(
                    title: "Places Around You",
                    placesList: placesList,
                  ),
                  Container(
                    padding: EdgeInsets.all(0.03 * size.width),
                    height: 0.45 * size.height,
                    child: ListViewBuilderMethod(),
                  ),
                  CategoryBtnAllPlaces(
                    title: "All Places",
                    placesList: placesList,
                  ),
                  Container(
                    padding: EdgeInsets.all(0.03 * size.width),
                    height: 0.45 * size.height,
                    child: ListViewBuilderMethod(),

                    //   ListView.builder(
                    //     itemBuilder: (context, index) {
                    //       return PlaceCardSqr(
                    //         name: placesList[index]['name'],
                    //         img_url: placesList[index]['image'],
                    //         prov: placesList[index]['province'],
                    //         desc: placesList[index]['description'],
                    //       );
                    //     },
                    //     itemCount: 3,
                    //     scrollDirection: Axis.horizontal,
                    //   ),
                    // ),
                    //SizedBox(height: 0.03 * size.height),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        child: Icon(
          Icons.refresh_rounded,
          size: 0.03 * size.height,
        ),
      ),
    );
  }

  ListView ListViewBuilderMethod() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return PlaceCardSqr(
          name: placesList[index]['name'],
          img_url: placesList[index]['image'],
          prov: placesList[index]['province'],
          desc: placesList[index]['description'],
        );
      },
      itemCount: 3,
      scrollDirection: Axis.horizontal,
    );
  }
}
