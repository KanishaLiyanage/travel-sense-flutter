import 'package:flutter/material.dart';

import '../models/backBtn.dart';

class HeaderwithBackBtn extends StatelessWidget {
  String title;

  HeaderwithBackBtn({required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 0.06 * size.width,
        right: 0.1 * size.width,
        top: 0.1 * size.height,
      ),
      child: Row(
        children: [
          BackBtn(),
          Container(
            margin: EdgeInsets.only(
              left: 0.04 * size.width,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF004581),
                fontWeight: FontWeight.w500,
                fontSize: 0.025 * size.height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
