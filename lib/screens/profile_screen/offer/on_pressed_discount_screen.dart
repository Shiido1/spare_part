import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparepart/screens/profile_screen/cart/add_to_cart_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';

class OnPressedDiscountScreen extends StatefulWidget {
  final String imageText;
  final String priceText;
  final String categoryText;
  final String nameText;
  final String descriptionText;

  const OnPressedDiscountScreen({
    Key key,
    this.imageText,
    this.priceText,
    this.categoryText,
    this.nameText,
    this.descriptionText}) : super(key: key);


  @override
  _OnPressedDiscountScreenState createState() => _OnPressedDiscountScreenState();
}

class _OnPressedDiscountScreenState extends State<OnPressedDiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.yellow,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: AppColor.black,),
          onPressed: ()=>Navigator.pop(context),),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              child: CachedNetworkImage(
                imageUrl: '$url${widget.imageText}',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                            mainAxisAlignment:MainAxisAlignment.spaceAround,
                            children: [
                              TextViewWidget(
                                text: widget.priceText,
                                color: AppColor.black,
                                textSize: 18,
                                fontWeight: FontWeight.bold,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:12,right: 12),
                                    child: TextViewWidget(
                                      textAlign: TextAlign.center,
                                      text: widget.nameText,
                                      fontWeight:FontWeight.w500,
                                      color: AppColor.black,textSize: 20,),
                                  ),
                                  TextViewWidget(
                                    text: widget.categoryText,
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
                              text: widget.descriptionText,
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
                              text: getNairaSign(context, widget.priceText),
                              color: AppColor.black,
                              textSize: 20,
                              fontWeight: FontWeight.bold,),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CartScreen()),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: AppColor.purple,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
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
            )
          ],
        ),
      ),
    );
  }
}
