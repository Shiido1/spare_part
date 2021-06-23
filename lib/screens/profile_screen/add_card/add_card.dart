import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNameHolderController = TextEditingController();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expMonthController = TextEditingController();
  TextEditingController expYearController = TextEditingController();
  
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
                        text: "Add Card",
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
                      text: 'Enter your Card Information',
                      textSize: 18,
                      color: Colors.black26,),
                    EditTextWidget(
                      err: 'please enter bank name',
                      textInputType: TextInputType.text,
                      label: 'Bank Name',
                      fontSize: 18,
                      controller: nameController,),
                    EditTextWidget(
                      err: 'please enter card number',
                      fontSize: 18,
                      label: 'Card Number',
                      textInputType: TextInputType.number,
                      controller: cardNoController,),
                    EditTextWidget(
                      err: 'please enter expiry month',
                      fontSize: 18,
                      label: 'Expiry Month',
                      textInputType: TextInputType.number,
                      controller: expMonthController,),
                    EditTextWidget(
                      label: 'Expiry Year',
                      fontSize: 18,
                      err: 'please enter expiry year',
                      textInputType: TextInputType.number,
                      controller: expYearController,),
                    EditTextWidget(
                      err: 'please enter card name',
                      textInputType: TextInputType.text,
                      label: 'Card Holder Name',
                      fontSize: 18,
                      controller: cardNameHolderController,),
                    SizedBox(height: 25,),
                    TextButton(
                      onPressed: (){},
                      child: TextViewWidget(
                        text: 'Add',
                        textSize: 23,
                        color: AppColor.purple,),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 13.0),
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
