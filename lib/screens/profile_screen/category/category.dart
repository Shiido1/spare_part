import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/bottom_navigation_bar/bottom_navigator.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class Category extends StatefulWidget {
  const Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                color: AppColor.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: (){},
                          color: AppColor.yellow,),
                        TextViewWidget(
                          text: "Categories",
                          color: AppColor.yellow,
                          fontWeight: FontWeight.w600,
                          textSize: 27,),
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
                    SizedBox(height: 15,),
                    EditTextWidget(
                        controller: searchController,
                        label: 'Search for category',
                        textInputType: TextInputType.text,
                        err: 'please search here'),
                  ],
                ),
              ),
            ),
            BottomNavigator(bottomNavIndex: 4,),
          ],
        ),
      ),
    );
  }
}
