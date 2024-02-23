import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_order/screens/rewardedscreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyBannerAdWidget extends StatefulWidget {





  const MyBannerAdWidget({
    super.key,

  });

  @override
  State<MyBannerAdWidget> createState() => _MyBannerAdWidgetState();
}

class _MyBannerAdWidgetState extends State<MyBannerAdWidget> {
  /// The banner ad to show. This is `null` until the ad is actually loaded.
  late  InterstitialAd _interstitialAd;
  bool isLoaded=false;

  @override
  void initState() {
    super.initState();
    initializedFullPage();


  }

  @override
  void dispose() {
    _interstitialAd.dispose();

    super.dispose();
  }

  /// Loads a banner ad.
  /*void _loadAd() {
    final bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }*/

  //// load  full screen

  void initializedFullPage(){
    InterstitialAd.load(adUnitId:
    'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){
              _interstitialAd=ad;
              setState(() {
             isLoaded=true;
              });
              _interstitialAd.fullScreenContentCallback=FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad)
                    {
                      ad.dispose();
                      setState(() {
                        isLoaded=false;
                      });
                      log("-----Add is Dismissed------");
                    },
                    onAdFailedToShowFullScreenContent: (err,ad){

          }
              );
            },
            onAdFailedToLoad: (err){
              _interstitialAd.dispose();
            }));
  }

  // rewarded
  /*void loadAd() {
    RewardedInterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        adRequest: const AdRequest(),
        adLoadCallback: RewardedInterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');

            _rewardedInterstitialAd = ad;
            setState(() {
              isLoaded=true;
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedInterstitialAd failed to load: $error');
          },
        ));
  }
}*/


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),)),
           SizedBox(height:20),
           ElevatedButton(onPressed: (){

             if(isLoaded){
               _interstitialAd.show();
             }
           }, child: Text("Interstitial")),
            SizedBox(height:30),
            ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>RewardedScreen()));
            }, child: Text("Next")),
          ],
        ),
      ),
    );
  }



}