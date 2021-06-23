import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

class Verify extends StatefulWidget {
  const Verify({Key key}) : super(key: key);

  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 1,),
            IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back_ios,color: AppColor.yellow,),),
            TextViewWidget(
              text: 'Verification',
              color: AppColor.black,
              textSize: 30,
              fontWeight: FontWeight.w500,),
            TextViewWidget(
              text: 'Please enter the OTP code sent to you by SMS',
              color: AppColor.black,
              textSize: 22,
              fontWeight: FontWeight.w400,),

            Center(
              child: PinEntryTextField(
                showFieldAsBox: true,
                isTextObscure: false,
                fields: 4,
                onSubmit: (String pin) =>{}
                    // _submitOtp(pin, util), // end onSubmit
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(left:25,right: 25,top: 30),
                child: TextButton(
                  onPressed: (){},
                  child: TextViewWidget(
                    text: 'Verify',
                    textSize: 23,
                    color: AppColor.purple,),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                    primary: AppColor.yellow,
                    shape: StadiumBorder(),
                  ),),
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  // text: util.timerIsNotExpired
                  //     ? 'Resend OTP in:  '
                  //     : 'I did\'t receive the code.  ',
                  text: 'Didn\u0027t get a code?',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColor.black,
                      fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer(),
                      //   ..onTap = () => util.timerIsNotExpired
                      //       ? null
                      //       : _otpProviders.resendOtp(
                      //       email: widget.email,
                      //       utilityProvider: _utilityProvider),
                      // text: util.timerIsNotExpired
                      //     ? '0${util.minute} : ${util.seconds.toString().length == 1 ? '0${util.seconds}' : util.seconds}'
                      //     :
                      // 'Resend OTP',
                      text: ' Send again'
                      ,style: TextStyle(
                        fontSize: 22,
                        color: AppColor.purple,
                        fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
