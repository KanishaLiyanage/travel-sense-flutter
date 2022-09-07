import 'package:flutter/material.dart';

import 'backBtn.dart';

AppBar CustomAppBar(Size size, {required String title}) {
  return AppBar(
    toolbarHeight: 0.12 * size.height,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leadingWidth: 0.235 * size.width,
    centerTitle: true,
    leading: Padding(
      padding: EdgeInsets.all(0.06 * size.width),
      child: BackBtn(),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Color(0xFF004581),
        fontWeight: FontWeight.w500,
        fontSize: 0.025 * size.height,
      ),
    ),
  );
}
