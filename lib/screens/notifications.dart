import 'package:flutter/material.dart';
import 'package:travel_sense/models/customAppBar.dart';

import '../models/backBtn.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFDDE8F0),
      appBar: CustomAppBar(
        size,
        title: "Notifications",
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
