import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:food_order/services/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdProvider extends ChangeNotifier{
  bool  isHomeLoader=false;
  late BannerAd homePageBanner;


  void initializeHomePageBanner()async{
    homePageBanner=BannerAd(size: AdSize.banner,
        adUnitId: AdHelper.homePageBanner(),

        request: const AdRequest(),
      listener:  BannerAdListener(
        onAdLoaded: (ad){
          log("------homePAGELOADING-------$ad");
          isHomeLoader=true;
          homePageBanner = ad as BannerAd;
        },
        onAdClosed: (ad){
          ad.dispose();

          isHomeLoader=false;
        },
        onAdFailedToLoad: (ad,err){
         log("----error----$err");
          isHomeLoader=false;
        }
      ));
    await homePageBanner.load();
    notifyListeners();
  }

}