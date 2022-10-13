import 'package:flutter/material.dart';

import '../screens/notifications.dart';

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
              // maxRadius: 28,
              maxRadius: 0.035 * size.height,
              backgroundImage: NetworkImage(
                  "https://cdn.dribbble.com/users/323571/screenshots/5412611/batman_4x.jpg"),
            ),
          ),
          Text(
            "Hi, Kanisha!",
            style: TextStyle(
              color: Color(0xFF004581),
              fontSize: 0.018 * size.height,
            ),
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationsScreen();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.notifications_active_rounded,
                size: 0.04 * size.height,
                color: Color(0xFF004581),
              )),
        ],
      ),
    );
  }
}
