import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  String title;

  CategoryButtons({required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 0.1 * size.width,
        right: 0.1 * size.width,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 0.3 * size.width,
            padding: EdgeInsets.all(0.01 * size.height),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
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
            onPressed: () {},
            child: Text(
              "View more",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF018ABD),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
