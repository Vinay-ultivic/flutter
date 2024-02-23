import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_order/screens/add_screen.dart';
import 'package:food_order/services/ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController pinController=TextEditingController();

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  /// Loads a banner ad.
  void _loadAd() {
    final bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  SizedBox(
        width: AdSize.banner.width.toDouble(),
        height: AdSize.banner.height.toDouble(),
        child: _bannerAd == null ? const SizedBox() : AdWidget(ad: _bannerAd!),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Column(children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                InkWell(onTap:(){
Navigator.pop(context);
                },child: const Icon(Icons.arrow_back,size: 30,)),
                const Text("We have sent verification code to",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.black),),
                const SizedBox(),
              ],),
              const Text("+91-88946565775"),
              const SizedBox(height: 20,),
              Pinput(
                length: 4,
                keyboardType: TextInputType.number,
                controller: pinController,
                textInputAction: TextInputAction.next,
                showCursor: true,
                onCompleted: null,
                onChanged: (value)
                {

                },
                onSubmitted: (value){

                },
              ),
            ],),
           const SizedBox(),
            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Did\'nt recieve the code?',
                        style: const TextStyle(
                            color: Colors.black, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(text: ' Resend Now',
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBannerAdWidget()));
                                }
                          )
                        ]
                    ),
                  ),
                )
            )

          ],),
        ),
      ),
    );
  }
}
