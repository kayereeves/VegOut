import 'dart:io';
import 'package:flutter/material.dart';
import 'about.dart';
import 'home.dart';
import 'search_recipe.dart';

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





