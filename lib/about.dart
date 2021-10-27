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
        leading: BackButton(
            color: Colors.deepOrangeAccent,
        ),
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Center(
                  child: Image.asset('resources/mascot2.png'),
                ),
                Center(
                    child: Text("VegOut is designed to help you find and save recipes that fit your dietary needs."+
                        " It uses an in-app web browser to search, filter, and view recipes online."+
                      "\n\nVegOut may display non-obtrusive banner ads, but it will never collect, store,"+
                      " or sell your personal information."+
                      " Websites accessed during use of this app may have their own consumer data policies."+
                      "\n\nAny questions, comments, concerns, or suggestions may be emailed to me at"+
                        " vegout.developer@gmail.com. Thank you for using VegOut!",
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