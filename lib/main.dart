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

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
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
                          MaterialPageRoute(builder: (context) => Search()),
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

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Center(
                  child: Image.asset('resources/placeholder_icon.png'),
                ),
                Center(
                    child: Text("search results", textAlign: TextAlign.center,)
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('dummy search result'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Menu()),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Map()),
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

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Center(
                  child: Image.asset('resources/placeholder_icon.png'),
                ),
                Center(
                    child: Text("menu data will be displayed here, probably retrieved via web scraper", textAlign: TextAlign.center,)
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('return to search'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Search()),
                      );
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('back'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Map()),
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

