

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/screens/profile_screen/landing_screen/landings.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  int pageLength = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[
          PageView(
            onPageChanged: (value) {
              setState(() => currentPage = value);
            },
            children: [
              Landing(
                image1: AppAssets.redFerrari,
                image2: AppAssets.logo,
                svgImageAsset: AppAssets.whiteBar,),
              Landing(
                image1: AppAssets.tyre,
                image2: AppAssets.purpleLogo,
                svgImageAsset: AppAssets.yellow,),
              Landing(
                image1: AppAssets.engine,
                image2: AppAssets.logo,
                svgImageAsset: AppAssets.whiteBar,),
              Landing(
                image1: AppAssets.iCar,
                image2: AppAssets.yellowLogo,
                svgImageAsset: AppAssets.purpleBar,),
            ],
          ),

          Positioned(
            bottom: 230,
            right: 140,
            child: Center(
              child: DotsIndicator(
                dotsCount: pageLength,
                position: double.parse(currentPage.toString()),
                decorator: DotsDecorator(
                    color: AppColor.black,
                    activeColor: Colors.white,
                    size: Size.square(8.0),
                    activeSize: Size.square(8.0)),
              ),
            ),
          ),],
      ),
    );
  }
}