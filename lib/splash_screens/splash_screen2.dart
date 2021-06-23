import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparepart/utils/assetsString.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key key}) : super(key: key);

  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
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
            AppAssets.tyre,
          ),
        ),
      ),

      child: Stack(
        children: [
          SvgPicture.asset(AppAssets.yellow),
          Padding(
            padding: const EdgeInsets.only(top:130,left: 40),
            child: Image(image: AssetImage(AppAssets.purpleLogo),),
          )
        ],
      ),
    );
  }
}
