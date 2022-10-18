import 'package:flutter/material.dart';
import 'package:travel_sense/services/covid.dart';
import 'package:travel_sense/services/weather.dart';
import 'package:travel_sense/utils/conditions.dart';

class WarningCard extends StatefulWidget {
  @override
  State<WarningCard> createState() => _WarningCardState();
}

class _WarningCardState extends State<WarningCard> {
  var warningStatus;

  Future getWarn() async {
    try {
      Warnings warnInfo = Warnings();
      await warnInfo.getAlerts();
      warningStatus = warnInfo.warningStatus;
      return warningStatus;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getWarn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0.04 * size.width),
            child: FutureBuilder(
              future: getWarn(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Text(
                    warningStatus['description'] +
                        " & " +
                        warningStatus['active_cases'].toString() +
                        " active Covid-19 cases in today!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 0.05 * size.width,
                    ),
                  );
                }
              },
            ),
          ),
          FutureBuilder(
            future: getWarn(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 0.04 * size.width),
                  child: Text(
                    warningStatus['warning_message'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 0.05 * size.width,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                );
              }
            },
          ),
        ],
      ),
      margin: EdgeInsets.all(0.04 * size.width),
      padding: EdgeInsets.all(0.05 * size.width),
      height: 0.3 * size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
