import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparepart/utils/assetsString.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({Key key}) : super(key: key);

  @override
  _SplashScreen4State createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
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
            AppAssets.iCar,
          ),
        ),
      ),

      child: Stack(
        children: [
          SvgPicture.asset(AppAssets.purpleBar),
          Padding(
            padding: const EdgeInsets.only(top:130,left: 40),
            child: Image(image: AssetImage(AppAssets.yellowLogo),),
          )
        ],
      ),
    );
  }
}
