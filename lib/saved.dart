import 'dart:io';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegout/saved_accessor.dart';

class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  var txt = "txt";

  _deleteSelection(selection) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(selection);
  }

  _clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  _getFaves() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //int counter = (prefs.getInt('counter') ?? 0) + 1;
    //print('Pressed $counter times.');
    //await prefs.setInt('counter', counter);

    for (var key in prefs.getKeys()) {
      String addr =  prefs.getString(key) as String;
      print(key + " " + addr);
    }

    //prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    _getFaves();
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Recipes'),
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Text(txt),
              ]
          )
      ),
    );
  }
}