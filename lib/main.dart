import 'package:bano_qabil_project/Facebook/NavigatorBar/navigator_bar.dart';
import 'package:bano_qabil_project/splash%20screen&onboarding/splash_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'Facebook/Menu/setting&privacy/recent_ad.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Facebook',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          scaffoldBackgroundColor: Colors.white,
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black)),
        ),
        home: const RecentAd());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// pending tasks
// profile tab bar 
// setting bottom sheet
// chat home textfield fix pending
// chat navigation //complete 
// friends banner and post pending
// issue 1 overflow onboarding text
// 2 chat screen stack response
// 3 notification text