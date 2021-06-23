import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isOnTap=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
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
                      Container(width: 70,),
                      TextViewWidget(
                        text: "Order",
                        color: AppColor.yellow,
                        fontWeight: FontWeight.bold,
                        textSize: 24,),
                      SizedBox(
                        height: 70,
                        width: 90,
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        container(text:'All Order'),
                        container(text:'Pending'),
                        container(text:'Processing'),
                        container(text:'Delivery',),
                      ],
                    ),
                    SizedBox(height: 15,),
                    orderItemContainer(),
                    orderItemContainer(),
                    orderItemContainer(),
                    orderItemContainer(),
                    orderItemContainer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget container({String text})=> InkWell(
    onTap: (){
      setState(() {
        isOnTap = true;
        print('purple');
      });
    },
    child: Container(
      height: 25,
      width: 75,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: isOnTap==true?AppColor.purple:Colors.white
      ),
      child: Center(
        child: TextViewWidget(
          text: '$text',
          color: isOnTap==true?AppColor.yellow:AppColor.black,),
      ),
    ),
  );

  Widget orderItemContainer()=>Container(
    height: 120,
    color: Colors.white,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(
                AppAssets.tyreWheel,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                TextViewWidget(
                    text: 'Wheels &  Tires',
                    color: AppColor.black,
                    textSize: 18,
                fontWeight: FontWeight.bold,),
                SizedBox(height: 5,),
                TextViewWidget(
                    text: 'N10000',
                    fontWeight: FontWeight.bold,
                    color: AppColor.purple),
                SizedBox(height: 5,),
                TextButton(
                  onPressed: (){},
                  child: TextViewWidget(
                    text: 'Processing',
                    textSize: 15,
                    color: AppColor.black,),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
                    primary: AppColor.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),)
              ],
            ),
            TextViewWidget(
                text: '4 May, 2020',
                color: AppColor.black)
          ],
        ),
        Expanded(child: Divider(thickness: 0.7, color: Colors.black26,))
      ],
    ),
  );
}
