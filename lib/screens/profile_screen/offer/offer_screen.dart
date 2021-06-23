import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(
                color: AppColor.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 100,width: 100,),
                    TextViewWidget(
                      text: "Offer",
                      color: AppColor.yellow,
                      textSize: 25,
                      fontWeight: FontWeight.bold,),
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(AppAssets.pic),
                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    customCard('30'),
                    customCard('15'),
                    customCard('12'),
                    Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customCard(String amount)=>Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: AppColor.yellow,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 150,
        child: Row(
          children: [
            SizedBox(
              height: 90,
              width: 90,
              child: ClipOval(
                child: Image(
                  image: AssetImage(AppAssets.pic),
                ),

              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextViewWidget(
                    text: "$amount% Discount",
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,textSize: 20,),
                  TextViewWidget(
                    text: "Order any part from app and get the discount",
                    color: AppColor.black,textSize: 16,),
                  TextViewWidget(
                    text: "Order Now",
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,textSize: 17,)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
