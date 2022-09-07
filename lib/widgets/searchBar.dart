import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 0.08 * size.height,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 0.1 * size.width,
        right: 0.1 * size.width,
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 12,
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 0.01 * size.height),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_rounded,
                size: 30,
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'Search Places',
        ),
      ),
    );
  }
}
