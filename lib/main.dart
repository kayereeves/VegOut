import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';
import 'about.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(VegApp());
}

class VegApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        fontFamily: 'ZenKurenaido',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.deepOrangeAccent, fontFamily: 'Lobster'),
          iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: TextTheme (
          bodyText1: TextStyle(color: Colors.deepOrangeAccent),
            bodyText2: TextStyle(color: Colors.deepOrangeAccent)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
            )
        ),
      ),
      home: Home(),
    );
  }
}





