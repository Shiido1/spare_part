import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: (){},
                      color: AppColor.yellow,),
                    TextViewWidget(
                      text: "Settingd",
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
            SizedBox(height: 20,),
            textCard(
                text: 'Push Notification',
                middleText: 'Off/On',icon: Icons.arrow_forward_ios_outlined),
            textCard(
                text: 'Language',
                middleText: 'English',
                icon: Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
  Widget textCard({String text,String middleText,IconData icon})=> Card(
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20,),
          TextViewWidget(
            text: '$text',
            color: AppColor.grey,textSize: 15,),
          SizedBox(width: 35,),
          TextViewWidget(
            text: '$middleText',
            color: AppColor.black,textSize: 20,),
          SizedBox(width: 35,),
          Icon(icon),

        ],
      ),
    ),
  );
}
