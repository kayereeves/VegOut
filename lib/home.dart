import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vegout/saved.dart';
import 'package:vegout/search_recipe.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegout/about.dart';

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
                      PageTransition(
                        curve: Curves.bounceOut,
                        type: PageTransitionType.rotate,
                        alignment: Alignment.topCenter,
                        child: SearchRecipe(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('my saved recipes'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        curve: Curves.bounceOut,
                        type: PageTransitionType.rotate,
                        alignment: Alignment.topCenter,
                        child: Saved(),
                      ),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text('about the app'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                        curve: Curves.bounceOut,
                        type: PageTransitionType.rotate,
                        alignment: Alignment.topCenter,
                        child: About(),
                    ),
                    );
                  },
                ),
              ]
          )
      ),
    );
  }
}