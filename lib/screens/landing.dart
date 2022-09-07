import 'dart:ui';

import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/pexels-lk.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
            SizedBox(height: 0.2 * size.height),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 0.06 * size.width,
                    right: 0.1 * size.width,
                  ),
                  child: Text(
                    "We're sensing you",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 0.025 * size.height,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 100.0,
                          color: Colors.black.withOpacity(1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: 0.12 * size.width,
                right: 0.1 * size.width,
              ),
              child: Column(
                children: [
                  Text(
                    "Out There,",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 0.05 * size.height,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 100.0,
                          color: Colors.black.withOpacity(1.0),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Go Explore",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 0.05 * size.height,
                      color: Colors.white,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(1.0, 1.0),
                          blurRadius: 100.0,
                          color: Colors.black.withOpacity(1.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.4 * size.height),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 0.025 * size.height,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF018ABD),
                onPrimary: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                minimumSize: Size(
                  0.5 * size.width,
                  0.12 * size.width,
                ), //////// HERE
              ),
            ),
          ],
        ),
      ),
    );
  }
}
