import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'map.dart';
import 'about.dart';
import 'home.dart';
import 'search.dart';
import 'menu.dart';

void main() {
  runApp(VegApp());
}

class VegApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)
            )
        ),
      ),
      home: Home(),
    );
  }
}





