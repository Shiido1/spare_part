import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparepart/utils/assetsString.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({Key key}) : super(key: key);

  @override
  _SplashScreen3State createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
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
            AppAssets.engine,
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
