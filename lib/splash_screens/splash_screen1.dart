import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          color: Colors.white,
          image: new DecorationImage(
            fit: BoxFit.cover,
            // colorFilter: new ColorFilter.mode(
            //     AppColor.black.withOpacity(1), BlendMode.dstATop),
            image: new AssetImage(
              AppAssets.redFerrari,
            ),
          ),
        ),

      child: Stack(
        children: [
          SvgPicture.asset(AppAssets.whiteBar),
          Padding(
            padding: const EdgeInsets.only(top:130,left: 40),
            child: Image(image: AssetImage(AppAssets.logo),),
          )
        ],
      ),
    );
  }
}
