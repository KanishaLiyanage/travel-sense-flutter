import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../services/location.dart';

import '../widgets/placeCardSqr.dart';
import '../widgets/searchBar.dart';
import '../widgets/welcomeTopic.dart';
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
  var geoCoderKey =
      "pk.eyJ1Ijoia2FuaXNoYWwiLCJhIjoiY2w2aXluanA5MHNnejNjcGRvYmZ6ZXViMyJ9.ugUAXJwneE9q_ifKtsfYiQ";
  var latitude;
  var longitude;
  var placesList = [];
  var placesAroundList = [];
  var city;
  var covidData;
  var today;

  Dio dio = Dio();

  Future getData() async {
    try {
      var response = await dio.get('$url/user/home');
      if (response.statusCode == 200) {
        placesList = response.data;
        //var placesListLength = (placesList.length).toString();
        //print(placesList[1]);
        //print(placesList);
        // print("Items Length is: " + placesListLength);
        // place = placesList[1];
        // print(place);
        // print(place['name']);
        // print(placesList[1]['name']);
        return placesList;
      } else {
        print("Server not responeded!");
      }
    } catch (e) {
      print(e);
    }
  }

  Future getAroundPlaces() async {
    Location location = Location();
    await location.getCurrentLocation();

    // latitude = location.latitude;
    // longitude = location.longitude;
    latitude = 7.465594251760848;
    longitude = 80.04799206741393;

    var geocoderURL = "https://api.mapbox.com/geocoding/v5/mapbox.places/" +
        longitude.toString() +
        "," +
        latitude.toString() +
        ".json?country=lk&limit=1&types=region&access_token=" +
        geoCoderKey;

    try {
      var geoResponse = await dio.get('$geocoderURL');

      if (geoResponse.statusCode == 200) {
        city = await geoResponse.data['features'][0]['text'];

        var nearestCity = ({"nearestCity": city});

        try {
          var aroundResponse = await dio.post('$url/user/home/placesAroundYou',
              data: nearestCity);

          if (aroundResponse.statusCode == 201) {
            placesAroundList = aroundResponse.data;
            //print("Nearest City: " + nearestCity.toString());
            //print(placesAroundList);
            return placesAroundList;
          } else {
            print("Server not responeded!");
          }
        } catch (e) {
          print(e);
        }
      } else {
        print("Server not responeded!");
      }
    } catch (e) {
      print(e);
    }
  }

  Future getCovid() async {
    var covidUrl = "https://www.hpb.health.gov.lk/api/get-current-statistical";
    try {
      var getCovidData = await dio.get("$covidUrl");
      if (getCovidData.statusCode == 200) {
        covidData = getCovidData.data;
        today = covidData['data']['local_new_cases'];
        if (today > 100) {
          return today;
        }
      } else {
        print("Server Error!");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    getAroundPlaces();
    getCovid();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(todayCases: getCovid),
            SizedBox(height: 0.04 * size.height),
            WelcomeTopic(),
            SizedBox(height: 0.04 * size.height),
            SearchBar(),
            SizedBox(height: 0.02 * size.height),
            Container(
              height: 0.52 * size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 0.02 * size.height),
                    Container(
                      margin: EdgeInsets.only(
                        left: 0.1 * size.width,
                        right: 0.1 * size.width,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AroundYouScreen(
                                      placesList: placesAroundList,
                                      getAroundPlaces: getAroundPlaces,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "View more (" +
                                  placesAroundList.length.toString() +
                                  ")",
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
                        future: getAroundPlaces(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return PlaceCardSqr(
                                  name: placesAroundList[index]['name'],
                                  img_url: placesAroundList[index]['image'],
                                  district: placesAroundList[index]['district'],
                                  desc: placesAroundList[index]['description'],
                                );
                              },
                              itemCount: placesAroundList == null
                                  ? 0
                                  : (placesAroundList.length >= 3
                                      ? 3
                                      : placesAroundList.length),
                              // placesAroundList.length,
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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
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
                              "View more (" +
                                  placesList.length.toString() +
                                  ")",
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
                                  district: placesList[index]['district'],
                                  desc: placesList[index]['description'],
                                );
                              },
                              itemCount: placesList == null
                                  ? 0
                                  : (placesList.length >= 3
                                      ? 3
                                      : placesList.length),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getAroundPlaces,
        child: Icon(
          Icons.refresh_rounded,
          size: 0.03 * size.height,
        ),
      ),
    );
  }
}
