import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/screens/profile_screen/offer/on_pressed_discount_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({Key key}) : super(key: key);

  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4,
                  decoration: BoxDecoration(
                    color: AppColor.purple,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios,color: AppColor.yellow,),
                        onPressed: ()=>Navigator.pop(context),),
                      TextViewWidget(
                        text: "Order",
                        color: AppColor.yellow,
                        textSize: 25,
                      fontWeight: FontWeight.bold,),
                      SizedBox(
                        height: 90,
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      orderItemContainer(screen:OnPressedDiscountScreen()),
                      orderItemContainer(screen:OnPressedDiscountScreen()),
                      orderItemContainer(screen:OnPressedDiscountScreen()),
                      orderItemContainer(screen:OnPressedDiscountScreen()),
                      orderItemContainer(screen:OnPressedDiscountScreen()),
                  ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orderItemContainer({Widget screen})=>InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    child: Container(
      height: 150,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextViewWidget(
                      text: 'Wheels &  Tires',
                      color: AppColor.black,
                    textSize: 20,
                      fontWeight: FontWeight.bold,),
                  SizedBox(height: 10,),

                  Column(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child: TextViewWidget(
                          text: '60%',
                          textSize: 15,
                          color: AppColor.black,),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                          primary: AppColor.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                        ),),
                      SizedBox(height: 10,),
                      TextViewWidget(
                        text: 'N7,000',
                        color: AppColor.black,
                        textSize: 15,)
                    ],
                  )
                ],
              ),
              TextViewWidget(
                  text: '4 May, 2020',
                  color: AppColor.black)
            ],
          ),
          Divider(thickness: 0.5, color: Colors.black26,)
        ],
      ),
    ),
  );
}
