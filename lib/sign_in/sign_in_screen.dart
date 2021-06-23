import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checkedValue = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45,),
              TextViewWidget(
                text: 'Welcome!',
                color: AppColor.black,
                textSize: 26,
                fontWeight: FontWeight.w500,),
              SizedBox(height: 25,),
              TextViewWidget(
                text: 'Login to your existing account',
                color: AppColor.black,
                textSize: 18,
                fontWeight: FontWeight.w400,),
              SizedBox(height: 25,),
              EditTextWidget(
                err: 'please enter email',
                textInputType: TextInputType.text,
                controller: emailController,
                hint: 'Email',
                hintFontSize: 20,
                label: 'please enter your email',),
              SizedBox(height: 25,),
              EditTextWidget(
                err: 'please enter password',
                textInputType: TextInputType.text,
                controller: passwordController,
                hintFontSize: 20,
                hint: 'Password',
                label: 'please enter your password',),
              SizedBox(height: 45,),
              Align(
                alignment: Alignment.centerRight,
                child: TextViewWidget(
                  text: 'Forgot Password',
                  color: AppColor.black,
                  textSize: 19,
                    ),
              ),
              CheckboxListTile(
                title: TextViewWidget(
                  text: 'Remember me',textSize: 19,color: AppColor.black,),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:25,right: 25,top: 30),
                  child: TextButton(
                    onPressed: (){},
                    child: TextViewWidget(
                      text: 'Login',
                      textSize: 23,
                      color: AppColor.purple,),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                      primary: AppColor.yellow,
                      shape: StadiumBorder(),
                    ),),
                ),
              )
              // Checkbox(value: value, onChanged: onChanged)
            ],
          ),
        ),
      ),
    );
  }
}
