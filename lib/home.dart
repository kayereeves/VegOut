import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vegout/saved.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vegout/about.dart';
import 'package:vegout/search_recipe.dart';
import 'package:vegout/size_config_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      //adUnitId: Platform.isAndroid
          //? 'ca-app-pub-9635169151246197/8143202064'
          //: 'ca-app-pub-9635169151246197/8143202064',
      adUnitId: Platform.isAndroid //demo ad units
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/6300978111',
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('VegOut'),
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                SizedBox(height: SizeConfig.safeBlockVertical * 15),
                Container(
                  height: SizeConfig.safeBlockVertical * 25,
                  width: SizeConfig.safeBlockHorizontal * 50,
                  child: Image.asset('resources/mascot2.png'),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 0),
                Container(
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.safeBlockHorizontal * 30,
                    child: ElevatedButton(
                      child: Text('help me find a recipe', textAlign: TextAlign.center),
                      onPressed: () {
                        Navigator.push(
                        context,
                        PageTransition(
                          curve: Curves.bounceOut,
                          type: PageTransitionType.rightToLeftWithFade,
                          alignment: Alignment.topCenter,
                          child: SearchRecipe(),
                        ),
                      );
                    },
                  )
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Container(
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.safeBlockHorizontal * 30,
                    child: ElevatedButton(
                      child: Text('my saved recipes', textAlign: TextAlign.center,),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            curve: Curves.bounceOut,
                            type: PageTransitionType.rightToLeftWithFade,
                            alignment: Alignment.topCenter,
                            child: Saved(),
                          ),
                        );
                      },
                    )
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Container(
                    height: SizeConfig.safeBlockVertical * 7,
                    width: SizeConfig.safeBlockHorizontal * 30,
                    child: ElevatedButton(
                      child: Text('about the app', textAlign: TextAlign.center),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            curve: Curves.bounceOut,
                            type: PageTransitionType.rightToLeftWithFade,
                            alignment: Alignment.topCenter,
                            child: About(),
                          ),
                        );
                      },
                    )
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                if (_anchoredAdaptiveAd != null && _isLoaded)
                  Container(
                    color: Colors.transparent,
                    width: _anchoredAdaptiveAd!.size.width.toDouble(),
                    height: _anchoredAdaptiveAd!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredAdaptiveAd!),
                  )
              ]
          )
      ),
    );
  }
}