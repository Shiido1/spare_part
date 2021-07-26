import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

import '../main_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1,),
            IconButton(onPressed:(){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios,color: AppColor.yellow,),),
            TextViewWidget(
              text: 'Forgot Password',
              color: AppColor.black,
              textSize: 26,
              fontWeight: FontWeight.w500,),
            // SizedBox(height: 25,),
            TextViewWidget(
              text: 'Please enter your email and we will send you a link to update your password',
              color: AppColor.black,
              textSize: 18,
              fontWeight: FontWeight.w400,),
            // SizedBox(height: 55,),
            EditTextWidget(
              err: 'please enter your name',
              textInputType: TextInputType.text,
              controller: emailController,
              hint: 'Email',
              hintFontSize: 20,
              label: 'please enter your email address',),
            SizedBox(height: 25,),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(left:25,right: 25,top: 30),
                child: TextButton(
                  onPressed: ()=>
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    ),
                  child: TextViewWidget(
                    text: 'Continue',
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
                  text: 'Don\u0027t have an account?',
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColor.black,
                      fontWeight: FontWeight.normal),
                  children: <TextSpan>[
                    TextSpan(
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = () => util.timerIsNotExpired
                      //       ? null
                      //       : _otpProviders.resendOtp(
                      //       email: widget.email,
                      //       utilityProvider: _utilityProvider),
                      // text: util.timerIsNotExpired
                      //     ? '0${util.minute} : ${util.seconds.toString().length == 1 ? '0${util.seconds}' : util.seconds}'
                      //     :
                      // 'Resend OTP',
                        text: 'Sign Up',
                        style: TextStyle(
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
