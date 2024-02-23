import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_order/providers/ad_provider.dart';
import 'package:food_order/screens/add_screen.dart';
import 'package:food_order/screens/home_screen.dart';
import 'package:food_order/screens/otp_screen.dart';
import 'package:food_order/screens/rewardedscreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<AdProvider>(create: (context)=>AdProvider())],child:  MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen()

    ) ,);
  }
}


