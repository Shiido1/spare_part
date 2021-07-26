import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparepart/screens/profile_screen/landing_screen/splashscreen.dart';
import 'package:sparepart/utils/color_assets/color.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.purple));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(bottomNavIndex: 6,),
    );
  }
}

