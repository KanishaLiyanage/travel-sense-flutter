import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../widgets/placeCardSqr.dart';
import '../widgets/searchBar.dart';
import '../widgets/weatherStatus.dart';
import '../widgets/header.dart';
import 'allPlaces.dart';
import 'aroundYou.dart';

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

  Future getData() async {
    try {
      var response = await dio.get('$url/user/home');
      placesList = response.data;
      //var placesListLength = (placesList.length).toString();
      //print(placesList[1]);
      // print("Items Length is: " + placesListLength);
      // place = placesList[1];
      // print(place);
      // print(place['name']);
      // print(placesList[1]['name']);
      // print('button clicked!');
      return placesList;
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
                  // CategoryBtnAroundU(
                  //   title: "Places Around You",
                  //   placesList: placesList,
                  //   getPlaces: getData,
                  // ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 0.1 * size.width,
                      right: 0.1 * size.width,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //width: 0.25 * size.width,
                          padding: EdgeInsets.all(0.01 * size.height),
                          child: Text(
                            "Places Around You",
                            style: TextStyle(
                              fontSize: 0.013 * size.height,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF018ABD),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AroundYouScreen(
                                    placesList: placesList,
                                    getAroundPlaces: getData,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "View more",
                            style: TextStyle(
                              fontSize: 0.015 * size.height,
                              color: Color(0xFF018ABD),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0.03 * size.width),
                    height: 0.45 * size.height,
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
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
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 0.1 * size.width,
                      right: 0.1 * size.width,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          //width: 0.25 * size.width,
                          padding: EdgeInsets.all(0.01 * size.height),
                          child: Text(
                            "All Places",
                            style: TextStyle(
                              fontSize: 0.013 * size.height,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF018ABD),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return AllPlacesScreen(
                                    placesList: placesList,
                                    getAllPlaces: getData,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(
                            "View more",
                            style: TextStyle(
                              fontSize: 0.015 * size.height,
                              color: Color(0xFF018ABD),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(0.03 * size.width),
                    height: 0.45 * size.height,
                    child: FutureBuilder(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
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
                      },
                    ),
                  ),
                  //SizedBox(height: 0.03 * size.height),
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
}
