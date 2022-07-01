import 'package:animal_biography_project/splash_screen.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(canvasColor: Colors.amberAccent),
      routes: {
        "/": (context) => SplashScreen(),
        "homepage": (context) => HomePage(),
        "detail_page": (context) => DetailScreen(
              type: '',
              title: '',
              image: '',
            ),
      },
    ),
  );
}
