import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
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


  String firstName='',lastName='',image='';

  @override
  void initState() {
    init();
    super.initState();
  }

  init()async{
    firstName = await preferencesHelper.getStringValues(key: 'first_name');
    lastName = await preferencesHelper.getStringValues(key: 'last_name');
    image = await preferencesHelper.getStringValues(key: 'profile_image');
    setState(() {});
  }

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
                height: MediaQuery.of(context).size.height/5,
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
                        height: 50,
                        width: 50,
                        child: image.isNotEmpty? ClipOval(
                          child: CachedNetworkImage(
                            imageUrl:image ?? '',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget:
                                (context, url, error) =>
                                Icon(Icons.error),
                          ),

                        ):Container(),
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
                            SizedBox(
                              height: 250,
                              width: 250,
                              child: ClipOval(
                                // child: Image(
                                //   image: AssetImage(AppAssets.pic),
                                // ),

                                child: CachedNetworkImage(
                                  imageUrl:image ?? '',
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget:
                                      (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            TextViewWidget(
                              text: "$firstName $lastName",
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
}
