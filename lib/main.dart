// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: VegOut(),
  ));
}

class VegOut extends StatelessWidget {
  const VegOut({Key? key}) : super(key: key);

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
              child: Image.asset('resources/placeholder_icon.png'),
            ),
          ElevatedButton(
          child: Text('help me find a restaurant'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
            ElevatedButton(
              child: Text('about the app'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdRoute()),
                );
              },
            ),
    ]
        )
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Center(
                  child: Image.asset('resources/placeholder_icon.png'),
                ),
                Center(
                    child: Text("todo: get API key and set up Google Maps", textAlign: TextAlign.center,)
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VegOut()),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('search results page'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VegOut()),
                      );
                    },
                  ),
                ),
              ]
          )
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);
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
                  child: Image.asset('resources/placeholder_icon.png'),
                ),
                Center(
                child: Text("about goes here", textAlign: TextAlign.center,)
                ),
                Center(
                child: ElevatedButton(
                  child: Text('back'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VegOut()),
                    );
                  },
                ),
                ),
              ]
          )
      ),
    );
  }
}

