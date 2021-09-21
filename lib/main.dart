import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
              child: Image.asset('resources/placeholder_icon.png'),
            ),
          ElevatedButton(
          child: Text('help me find a restaurant'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Map()),
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

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Row(
                  children: <Widget> [
                    Image.asset('resources/placeholder_icon.png'),
                    ElevatedButton(
                      child: Text('go'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                ]
                ),
                Center(
                    child: Text("todo: get API key and integrate Google Maps", textAlign: TextAlign.center,)
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
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

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
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
                      MaterialPageRoute(builder: (context) => Home()),
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

