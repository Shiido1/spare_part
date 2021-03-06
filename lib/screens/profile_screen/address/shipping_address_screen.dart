import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({Key key}) : super(key: key);

  @override
  _ShippingAddressScreenState createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/4,
                decoration: BoxDecoration(
                  color: AppColor.purple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        color: AppColor.yellow,),
                      TextViewWidget(
                        text: "Shipping Address",
                        color: AppColor.yellow,
                        fontWeight: FontWeight.w500,
                        textSize: 25,),
                      SizedBox(
                        height: 90,
                        width: 70,
                        child: ClipOval(
                          child: Image(
                            image: AssetImage(AppAssets.pic2),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    TextViewWidget(
                      text: 'Your Shipping address',
                      textSize: 18,
                      color: Colors.black26,),
                    SizedBox(height: 35,),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppAssets.yellowAddress),
                            SizedBox(width: 15,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextViewWidget(
                                      text: 'Prince David',
                                      textSize: 21,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black),
                                  TextViewWidget(
                                      text: '24 I.T Igbani street off Obafemi Owolowo way',
                                      textSize: 17,
                                      color: AppColor.black),
                                  TextButton(
                                    onPressed: (){},
                                    child: TextViewWidget(
                                      text: 'Edit',
                                      textSize: 16,
                                      color: AppColor.purple,),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                                      primary: AppColor.yellow,
                                      shape: StadiumBorder(),
                                    ),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),)
            ],
          ),
        ),
      )
    );
  }
}
