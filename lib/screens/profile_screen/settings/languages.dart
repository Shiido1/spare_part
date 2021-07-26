import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class Language extends StatefulWidget {
  const Language({Key key}) : super(key: key);

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
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
                        onPressed: (){Navigator.pop(context);},
                        color: AppColor.yellow,),
                      TextViewWidget(
                        text: "Language",
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
                      text: 'Select a Language',
                      color: Colors.black26,textSize: 18,),
                    SizedBox(height: 35,),
                    textCard(text: 'English',icon: AppAssets.english),
                    textCard(text: 'French',icon: AppAssets.french),
                    textCard(text: 'Germany',icon: AppAssets.germany),
                    textCard(text: 'Chinese',icon: AppAssets.chinese),
                    textCard(text: 'Japan',icon:  AppAssets.japan),
                    textCard(text: 'Turkey',icon: AppAssets.turkey),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget textCard({String text,String icon})=> Card(
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20,),
          Image(image:AssetImage(icon)),
          SizedBox(width: 35,),
          TextViewWidget(
            text: '$text',
            color: AppColor.black,textSize: 20,)
        ],
      ),
    ),
  );
}
