import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vegout/search_recipe.dart';
import 'about.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VegOut Home'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Center(
                  child: Image.asset('resources/mascot2.png'),
                ),
                ElevatedButton(
                  child: Text('help me find a recipe'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchRecipe()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('about the app'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  },
                ),
              ]
          )
      ),
    );
  }
}