import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 0.1 * size.width,
        right: 0.1 * size.width,
        top: 0.1 * size.height,
      ),
      child: Row(
        //profile status
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(right: 0.04 * size.width),
            child: CircleAvatar(
              maxRadius: 28,
              backgroundImage: NetworkImage(
                  "https://cdn.dribbble.com/users/323571/screenshots/5412611/batman_4x.jpg"),
            ),
          ),
          Text(
            "Hi, Kanisha!",
            style: TextStyle(
              color: Color(0xFF004581),
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active_rounded,
                size: 35,
              )),
        ],
      ),
    );
  }
}
