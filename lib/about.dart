import 'dart:io';
import 'package:flutter/material.dart';
import 'home.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Center(
                  child: Image.asset('resources/mascot2.png'),
                ),
                Center(
                    child: Text("VegOut is designed to help you find and save recipes that fit your dietary needs",
                      textAlign: TextAlign.center,)
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('back'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]
          )
      ),
    );
  }
}