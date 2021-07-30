import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/image_loader.dart';
import 'package:sparepart/widgets/text_widget.dart';

import '../main_screen.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({Key key}) : super(key: key);

  @override
  _SuccessfulScreenState createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      text: "Payment",
                      color: AppColor.yellow,
                      fontWeight: FontWeight.bold,
                      textSize: 25,),
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
                SizedBox(height: 100,),
             Flexible(
               child: ImageLoader(
                 path: AppAssets.success,
                 height: 250,
                 width: 350,
               ),
             ),
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
                child: TextViewWidget(
                    textAlign: TextAlign.center,
                    text: 'Payment Successful',
                    color: AppColor.purple,
                    textSize: 30,
                    fontWeight: FontWeight.bold,),
              )
      ]
        ),
      ),
    );
  }
}
