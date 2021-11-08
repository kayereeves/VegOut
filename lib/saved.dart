import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegout/saved_accessor.dart';
import 'package:vegout/size_config_helper.dart';

class Saved extends StatefulWidget {
  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  var txt = "txt";
  List<Widget> savedList = [];

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
  void dispose() {
    super.dispose();
    _anchoredAdaptiveAd?.dispose();
  }

  @override
  void initState() {
    _getFaves();
    super.initState();
  }

  _getFaves() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();

    if (keys.length == 0) {
      savedList.add(
        new Container(
            height: SizeConfig.safeBlockVertical * 7,
            width: SizeConfig.safeBlockHorizontal * 30,
            child: new Text("you don't have any recipes saved yet :(", textAlign: TextAlign.center)
        )
      );
    }
    for (int i = 0; i < keys.length; i++) {
      print(keys.length.toString());
      savedList.add(
        new Container(
          height: SizeConfig.safeBlockVertical * 7,
          width: SizeConfig.safeBlockHorizontal * 30,
          child: new ElevatedButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                  children: <Widget> [
                    Text(keys.elementAt(i)),
                    new IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        prefs.remove(keys.elementAt(i));
                        //setState(() {});
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          PageTransition(
                            curve: Curves.bounceOut,
                            type: PageTransitionType.fade,
                            alignment: Alignment.topCenter,
                            child: Saved(),
                          ),
                        );
                    }
                    )
                  ]
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.bounceOut,
                    type: PageTransitionType.rightToLeftWithFade,
                    alignment: Alignment.topCenter,
                    child: SavedAccessor(webAddress: prefs.getString(keys.elementAt(i)),
                    note: keys.elementAt(i)),
                  ),
                );
              }
          )
        )
      );
    }
    setState(() {});
    print("list size: "+ savedList.length.toString());

    //prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Recipes'),
      ),
        body: new Column(
          children: <Widget>[
            SizedBox(height: SizeConfig.safeBlockVertical * 40),
            new Expanded(
                child: new ListView.builder
                  (
                    itemCount: savedList.length,
                    itemBuilder: (BuildContext ctxt, int Index) {
                      return savedList[Index] as Container;
                    }
                )
            ),
            if (_anchoredAdaptiveAd != null && _isLoaded)
              Container(
                color: Colors.green,
                width: _anchoredAdaptiveAd!.size.width.toDouble(),
                height: _anchoredAdaptiveAd!.size.height.toDouble(),
                child: AdWidget(ad: _anchoredAdaptiveAd!),
              )
          ],
        ),
    );
  }
}