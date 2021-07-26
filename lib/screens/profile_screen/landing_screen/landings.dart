import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparepart/sign_in/sign_in_screen.dart';

class Landing extends StatefulWidget {
  final String image1;
  final String image2;
  final String svgImageAsset;

  Landing({this.image1, this.image2, this.svgImageAsset});

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      ),
      child: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        decoration: new BoxDecoration(
          color: Colors.white,
          image: new DecorationImage(
            fit: BoxFit.cover,
            // colorFilter: new ColorFilter.mode(
            //     AppColor.black.withOpacity(1), BlendMode.dstATop),
            image: new AssetImage(
              widget.image1,
            ),
          ),
        ),

        child: Stack(
          children: [
            SvgPicture.asset(widget.svgImageAsset),
            Padding(
              padding: const EdgeInsets.only(top:130,left: 40),
              child: Image(image: AssetImage(widget.image2),),
            )
          ],
        ),
      ),
    );
  }
}
