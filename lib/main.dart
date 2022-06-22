import 'package:flutter/material.dart';
import 'package:time_app/screens/home.dart';
import 'package:time_app/screens/choose_loc.dart';
import 'package:time_app/screens/loading.dart';

//author @ Aballey Wilson Wenawome

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => Choose_location(),
      },
    ),
  );
}
