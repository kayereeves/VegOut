import 'dart:io';
import 'package:flutter/material.dart';
import 'search_recipe_keywords.dart';
import 'package:page_transition/page_transition.dart';

class SearchRecipe extends StatefulWidget {
  var selection = "";

  @override
  _SearchRecipeState createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
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
                ListTile(
                  title: const Text('Vegan'),
                  leading: Radio<String>(
                    value: "Vegan",
                    groupValue: widget.selection,
                    onChanged: (value) {
                      setState(() {
                          widget.selection = value as String;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Vegetarian'),
                  leading: Radio<String>(
                    value: "Vegetarian OR " + "Meatless OR " + "Vegan ",
                    groupValue: widget.selection,
                    onChanged: (value) {
                      setState(() {
                        widget.selection = value as String;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Pescetarian'),
                  leading: Radio<String>(
                    value: "Seafood OR " + "Fish OR " + "Shrimp OR " + "Crab OR " + "Clam OR " + "Lobster ",
                    groupValue: widget.selection,
                    onChanged: (value) {
                      setState(() {
                        widget.selection = value as String;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Keto'),
                  leading: Radio<String>(
                    value: "Keto",
                    groupValue: widget.selection,
                    onChanged: (value) {
                      setState(() {
                        widget.selection = value as String;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Gluten Free'),
                  leading: Radio<String>(
                    value: "Gluten Free",
                    groupValue: widget.selection,
                    onChanged: (value) {
                      setState(() {
                        widget.selection = value as String;
                      });
                    },
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    child: Text('next'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          curve: Curves.bounceOut,
                          type: PageTransitionType.rotate,
                          alignment: Alignment.topCenter,
                          child: SearchRecipeKeywords(selection: widget.selection),
                        ),
                        //MaterialPageRoute(builder: (context) => SearchRecipeKeywords(selection: widget.selection)),
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