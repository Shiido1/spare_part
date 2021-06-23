import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  TextEditingController cardNoController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  bool checkedValue=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(
                color: AppColor.purple,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 100,),
                  TextViewWidget(
                    text: "Payment",
                    color: AppColor.yellow,
                    fontWeight: FontWeight.bold,
                    textSize: 25,),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(AppAssets.pic),
                      ),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60,),
            Center(child: TextViewWidget(text: 'N30,000', color: AppColor.black,textSize:28,)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                // height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textView(
                        controller: cardNoController,
                        text: 'xxxx xxxx xxxx xxxx',
                        hint: "Card Number",
                        width: 100),
                    textView(
                      controller: cardHolderController,
                      text: 'Card Name',
                      hint: 'Card Holder Name',
                      width: 100
                    ),
                    Center(
                      child: Row(
                        children: [
                          textView(
                              controller: expiryDateController,
                              hint:'Expiry Date',text: '15/24',
                              width: 100),
                          SizedBox(width: 50,),
                          textView(
                              controller: cvvController,
                              hint:'CVV',text: 'cvv',
                              width: 100),
                        ],
                      ),
                    ),
                    CheckboxListTile(
                      title: TextViewWidget(
                        text: 'Save Card',color: AppColor.purple,),
                      value: checkedValue,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(left:25,right: 25),
                      child: TextButton(
                        onPressed: (){},
                        child: TextViewWidget(
                          text: 'Pay Securely',
                          textSize: 20,
                          color: Colors.white,),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          primary: AppColor.purple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textView({TextEditingController controller,String text,String hint,double width}) =>
      SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: controller,
              style: TextStyle(color: AppColor.grey),
              decoration: new InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: AppColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: AppColor.grey),
                ),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: AppColor.grey),
                ),
                labelText: '$text',
                hintText: '$hint',
                labelStyle: TextStyle(color: AppColor.grey),
                hintStyle: TextStyle(color: AppColor.purple),
                // errorText: 'Please enter your name',
              ),
            ),
            SizedBox(height: 35,)
          ],
        ),
      );
}
