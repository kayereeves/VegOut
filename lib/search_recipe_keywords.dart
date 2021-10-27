import 'dart:io';
import 'package:flutter/material.dart';
import 'search_recipe_results.dart';
import 'package:page_transition/page_transition.dart';

class SearchRecipeKeywords extends StatefulWidget {
  final myController = TextEditingController();
  final selection;
  var keywords = "";

  SearchRecipeKeywords({ this.selection });

  @override
  _SearchRecipeKeywordsState createState() => _SearchRecipeKeywordsState();
}

class _SearchRecipeKeywordsState extends State<SearchRecipeKeywords> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for Recipes"),
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
                    child: TextField(
                        controller: widget.myController,
                        decoration: InputDecoration(hintText: "Pizza, Smoothie, Caesar Salad, etc..."),
                    ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('search'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          curve: Curves.bounceOut,
                          type: PageTransitionType.rotate,
                          alignment: Alignment.topCenter,
                          child: SearchResults(selection: widget.selection,
                          keywords: widget.myController.text),
                        ),
                        //context,
                        //MaterialPageRoute(builder: (context) => SearchResults(selection: widget.selection,
                            //keywords: widget.myController.text)),
                      );
                    },
                  ),
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