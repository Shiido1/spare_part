import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
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
                          onPressed: (){
                            Navigator.pop(context);
                          },
                      color: AppColor.yellow,),
                      TextViewWidget(
                        text: "Edit Profile",
                        color: AppColor.yellow,
                        fontWeight: FontWeight.w500,
                        textSize: 24,),
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
              SingleChildScrollView(
                child: Column(
                  children: [

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 15,),
                            ClipOval(
                              child: Image(
                                image: AssetImage(AppAssets.pic2),
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextViewWidget(
                              text: "Princess Davidine",
                              color: AppColor.black,
                              textSize: 28,),
                            SizedBox(height: 10,),
                            EditTextWidget(
                              showIconPicker: true,
                              assetsName: AppAssets.user,
                              err: 'please enter name',
                              label: 'Name',
                              fontSize: 18,
                              textInputType: TextInputType.text,
                              controller: nameController,),
                            EditTextWidget(
                              showIconPicker: true,
                              iconData: Icons.mail_outline,
                              err: 'please enter email',
                              label: 'Email',
                              fontSize: 18,
                              textInputType: TextInputType.text,
                              controller: emailController,),
                            EditTextWidget(
                              showIconPicker: true,
                              iconData: Icons.phone,
                              err: 'please enter phone number',
                              label: 'Phone number',
                              fontSize: 18,
                              textInputType: TextInputType.number,
                              controller: numberController,),
                            EditTextWidget(
                              showIconPicker: true,
                              iconData: Icons.flag_outlined,
                              err: 'please enter country',
                              label: 'Country',
                              fontSize: 18,
                              textInputType: TextInputType.text,
                              controller: countryController,),
                            ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    TextButton(
                        onPressed: (){},
                        child: TextViewWidget(
                          text: 'Save',
                          textSize: 23,
                          color: AppColor.purple,),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 13.0),
                          primary: AppColor.yellow,
                          shape: StadiumBorder(),
                        ),),
                    SizedBox(height: 50,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget textCard({String text,String icon})=> Card(
  //   child: Container(
  //     height: 50,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       // boxShadow: <BoxShadow>[
  //       //   BoxShadow(
  //       //       color: Colors.black54,
  //       //       blurRadius: 15.0,
  //       //       offset: Offset(0.0, 0.75)
  //       //   )
  //       // ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         SizedBox(width: 20,),
  //         SvgPicture.asset(icon),
  //         SizedBox(width: 35,),
  //         TextViewWidget(
  //           text: '$text',
  //           color: AppColor.black,textSize: 20,)
  //       ],
  //     ),
  //   ),
  // );

}
