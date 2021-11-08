import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vegout/size_config_helper.dart';
import 'search_recipe_results.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SearchRecipe extends StatefulWidget {
  final myController = TextEditingController();
  var keywords = "";

  @override
  _SearchRecipeState createState() => _SearchRecipeState();
}

class _SearchRecipeState extends State<SearchRecipe> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.myController.dispose();
    _anchoredAdaptiveAd?.dispose();
    super.dispose();
  }

  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
    await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    _anchoredAdaptiveAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-9635169151246197/8143202064'
          : 'ca-app-pub-9635169151246197/8143202064',
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for Recipes"),
        leading: BackButton(
          color: Colors.deepOrangeAccent,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: <Widget> [
                Container(
                  height: SizeConfig.safeBlockVertical * 7,
                  width: SizeConfig.safeBlockHorizontal * 50,
                  child: Text("type the kind of recipe you're looking for in the box below",
                      textAlign: TextAlign.center)
                ),
                Container(
                  height: SizeConfig.safeBlockVertical * 5,
                  width: SizeConfig.safeBlockHorizontal * 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                        controller: widget.myController,
                        decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Container(
                  height: SizeConfig.safeBlockVertical * 5,
                  width: SizeConfig.safeBlockHorizontal * 30,
                  child: ElevatedButton(
                    child: Text('search'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          curve: Curves.bounceOut,
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          child: SearchResults(keywords: widget.myController.text),
                        ),
                      );
                    },
                  ),
                ),
                if (_anchoredAdaptiveAd != null && _isLoaded)
                  Container(
                    color: Colors.green,
                    width: _anchoredAdaptiveAd!.size.width.toDouble(),
                    height: _anchoredAdaptiveAd!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredAdaptiveAd!),
                  )
              ]
          )
      ),
    )
    );
  }
}