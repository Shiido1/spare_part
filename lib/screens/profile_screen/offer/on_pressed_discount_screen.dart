import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class OnPressedDiscountScreen extends StatefulWidget {
  const OnPressedDiscountScreen({Key key}) : super(key: key);

  @override
  _OnPressedDiscountScreenState createState() => _OnPressedDiscountScreenState();
}

class _OnPressedDiscountScreenState extends State<OnPressedDiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellow,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: Image(
                image: AssetImage(AppAssets.tyreWheel),
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 16.0),
              child: Container(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        height:120,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                            children: [
                              TextViewWidget(
                                text: '7000',
                                color: AppColor.black,
                                textSize: 18,
                                fontWeight: FontWeight.bold,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  TextViewWidget(
                                    text: 'Wheels & Tires',
                                    fontWeight:FontWeight.w500,
                                    color: AppColor.black,textSize: 20,),
                                  TextViewWidget(
                                    text: 'Car Parts',
                                    fontWeight:FontWeight.w500,
                                    color: AppColor.black,textSize: 17,),
                                  TextViewWidget(
                                    text: 'Spare Parts',
                                    fontWeight:FontWeight.w500,
                                    color: AppColor.black,textSize: 17,),


                                ],),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star,color: AppColor.yellow,size: 20,),
                                  TextViewWidget(
                                    text: '4.5',
                                    color: AppColor.black,
                                    textSize: 17,fontWeight: FontWeight.w500,)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: AppColor.purple,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(

                            decoration:  BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                            ),
                            // height: 70,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextViewWidget(
                                      text: 'Details',
                                      color: AppColor.black,
                                      textSize: 17,
                                    ),TextViewWidget(
                                      text: 'Reviews (300)',
                                      color: AppColor.grey,
                                      textSize: 17,
                                    ),
                                  ],
                                ),
                                Divider(thickness: 0.5,color: Colors.blueGrey,),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextViewWidget(
                              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis felis arcu, sit amet interdum sapien vehicula at. Vestibulum dignissim libero nec mauris egestas mattis. Fusce odio ante, eleifend non nisi a, facilisis obortis nulla. Donec posuere nisl at felis molestie dignissim.',
                              color: Colors.white,
                              textSize: 17,
                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    Card(
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),),
                      color: Colors.white,
                      child: Container(

                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextViewWidget(
                              text: 'N10,000',
                              color: AppColor.black,
                              textSize: 20,
                              fontWeight: FontWeight.bold,),
                            Container(
                              width: 150,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: AppColor.purple,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.shoppingCart,
                                    color: Colors.white,),
                                  TextViewWidget(
                                      text: 'Add To Cart',
                                      color: Colors.white)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
