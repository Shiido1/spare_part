import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  color: AppColor.purple,
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
                      customCard(
                          labelText: 'Categories' ),
                  Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customCard({String labelText}) {
    return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: AppColor.yellow,
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                TextViewWidget(
                  text: labelText,
                  color: AppColor.black,
                  textSize: 20,),
                Spacer(),
                TextViewWidget(
                  text: 'See all',
                  color: AppColor.purple,
                  textSize: 14,)
              ],
            ),
            Divider(thickness: 0.7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Column(
                      children: [
                        Container(
                          color:AppColor.purple,
                          height: 100,
                          child: Image(
                            image: AssetImage(
                                AppAssets.tyreWheel
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextViewWidget(
                            text: 'Wheel', color: AppColor.black,textSize: 14)
                      ],
                    )),
                SizedBox(width: 5,),
                Expanded(
                    child: Column(
                      children: [
                        Container(
                        color:AppColor.purple,
                        height: 100,
                            child: Image(
                            image: AssetImage(
                              AppAssets.tyreWheel
                          ),
                        ),
                      ),
                        SizedBox(height: 10,),
                    TextViewWidget(
                        text: 'Wheel', color: AppColor.black,textSize: 14)
                  ],
                )),
                SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        color:AppColor.purple,
                        height: 100,
                        child: Image(
                          image: AssetImage(
                              AppAssets.tyreWheel
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextViewWidget(
                        text: 'Wheel', color: AppColor.black,textSize: 14,)
                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
