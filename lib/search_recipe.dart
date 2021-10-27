import 'dart:io';
import 'package:flutter/material.dart';
import 'search_recipe_keywords.dart';

class SearchRecipe extends StatefulWidget {
  var selection = "";
  var keywords = "";
  @override
  _SearchRecipeState createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for Recipes"),
        backgroundColor: Colors.green,
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
                        MaterialPageRoute(builder: (context) => SearchRecipeKeywords(selection: widget.selection)),
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