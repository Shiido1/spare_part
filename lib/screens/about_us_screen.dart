import 'package:flutter/material.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/string_asstes.dart';
import 'package:sparepart/widgets/app_bar.dart';
import 'package:sparepart/widgets/text_widget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,
          showLeading: true,
          leadingWidget: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColor.yellow,
              )),
          centerTitle: true,
          backgroundColor: AppColor.purple,
          color: AppColor.yellow,
          title: 'About Us'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextViewWidget(
                text: 'About us',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(
                height: 20,
              ),
              TextViewWidget(
                  text: StringAssets.aboutUsText, color: AppColor.black),
            ],
          ),
        ),
      ),
    );
  }
}
