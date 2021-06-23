import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class Address extends StatefulWidget {
  const Address({Key key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
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
                        onPressed: (){},
                        color: AppColor.yellow,),
                      TextViewWidget(
                        text: "Add Address",
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
                padding: const EdgeInsets.only(left:25,right:25),
                child: Column(
                  children: [
                    TextViewWidget(
                        text: 'Enter your Shipping address',
                        textSize: 18,
                        color: Colors.black26,),
                    EditTextWidget(
                      err: 'please enter full name',
                      textInputType: TextInputType.text,
                      label: 'Name',
                      fontSize: 18,
                      controller: nameController,),
                    EditTextWidget(
                      err: 'please enter email',
                      fontSize: 18,
                      label: 'Email',
                      textInputType: TextInputType.text,
                      controller: emailController,),
                    EditTextWidget(
                      err: 'please enter phone',
                      fontSize: 18,
                      label: 'Phone',
                      textInputType: TextInputType.number,
                      controller: numberController,),
                    EditTextWidget(
                      label: 'Country',
                      fontSize: 18,
                      err: 'please enter country',
                      textInputType: TextInputType.text,
                      controller: countryController,),
                    EditTextWidget(
                      label: 'City/Town',
                      fontSize: 18,
                      err: 'please enter city or town',
                      textInputType: TextInputType.text,
                      controller: cityController,),
                    EditTextWidget(
                      err: 'please enter address',
                      fontSize: 18,
                      label: 'Address',
                      textInputType: TextInputType.text,
                      controller: addressController,),
                    EditTextWidget(
                      err: 'please enter post-code',
                      fontSize: 18,
                      label: 'Post Code',
                      textInputType: TextInputType.number,
                      controller: postCodeController,),
                    SizedBox(height: 25,),
                    TextButton(
                      onPressed: (){},
                      child: TextViewWidget(
                        text: 'Add',
                        textSize: 23,
                        color: AppColor.purple,),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 13.0),
                        primary: AppColor.yellow,
                        shape: StadiumBorder(),
                      ),),
                    SizedBox(height: 50,),
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
