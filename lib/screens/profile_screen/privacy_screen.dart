import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/string_asstes.dart';
import 'package:sparepart/widgets/app_bar.dart';
import 'package:sparepart/widgets/text_widget.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key key}) : super(key: key);

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
          title: 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextViewWidget(
                text: 'Privacy & Cookie Policy',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(
                height: 20,
              ),
              TextViewWidget(text: StringAssets.pText1, color: AppColor.black),
              SizedBox(
                height: 20,
              ),
              TextViewWidget(
                text: 'Who are we',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(
                height: 20,
              ),
              TextViewWidget(text: StringAssets.pText2, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'What personal data we collect and why we collect it',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText3, color: AppColor.black),
              SizedBox(
                height: 20,
              ),
              TextViewWidget(
                text: 'Comments',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText4, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'Cookies Policy',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText5, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'Embedded content from other websites',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText6, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'Who we share your data with',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText7, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'How long we retain your data',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText8, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'What rights you have over your data',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText9, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'Security',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText10, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'Changes to this privacy policy',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText11, color: AppColor.black),
              SizedBox(height: 20),
              TextViewWidget(
                text: 'Contact information',
                color: AppColor.purple,
                fontWeight: FontWeight.w500,
                textSize: 22,
              ),
              SizedBox(height: 20),
              TextViewWidget(text: StringAssets.pText12, color: AppColor.black),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
