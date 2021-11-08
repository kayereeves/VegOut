import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vegout/size_config_helper.dart';
import 'home.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                SizedBox(height: SizeConfig.safeBlockVertical * 35),
                Container(
                    height: SizeConfig.safeBlockVertical * 35,
                    width: SizeConfig.safeBlockHorizontal * 70,
                    child: Text("VegOut is a virtual recipe book designed to help you find and save recipes."+
                        " it uses an in-app web browser to search, filter, and view recipes online."+
                      "\n\nany questions, comments, concerns, or suggestions may be emailed to me at"+
                        " vegout.developer@gmail.com. thank you for using VegOut!",
                      textAlign: TextAlign.center,)
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
    );
  }
}