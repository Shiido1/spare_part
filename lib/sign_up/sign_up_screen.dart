import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/screens/profile_screen/verification/verification_screen.dart';
import 'package:sparepart/sign_in/sign_in_screen.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 45,),
              TextViewWidget(
                text: 'Sign Up',
                color: AppColor.black,
                textSize: 26,
                fontWeight: FontWeight.w500,),
              SizedBox(height: 15,),
              TextViewWidget(
                text: 'Please enter your information below to sign in',
                color: AppColor.black,
                textSize: 18,
                fontWeight: FontWeight.w400,),
              SizedBox(height: 25,),
              EditTextWidget(
                err: 'please enter your first name',
                textInputType: TextInputType.text,
                controller: firstNameController,
                hint: 'First Name',
                hintFontSize: 20,
                label: 'please enter your first name',),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter your last name',
                textInputType: TextInputType.text,
                controller: lastNameController,
                hint: 'Last Name',
                hintFontSize: 20,
                label: 'please enter your last name',),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter phone number',
                textInputType: TextInputType.number,
                controller: phoneNoController,
                hintFontSize: 20,
                hint: 'Phone No',
                label: 'please enter your phone number',),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter email',
                textInputType: TextInputType.text,
                controller: emailController,
                hintFontSize: 20,
                hint: 'Email',
                label: 'please enter your email',),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter password',
                textInputType: TextInputType.text,
                controller: passwordController,
                hintFontSize: 20,
                hint: 'Password',
                label: 'please enter your password',),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please confirm password',
                textInputType: TextInputType.text,
                controller: confirmPasswordController,
                hintFontSize: 20,
                hint: 'Confirm Password',
                label: 'please confirm your password',),
              SizedBox(height: 35,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:25,right: 25,top: 30),
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Verify()),
                      );
                    },
                    child: TextViewWidget(
                      text: 'Sign Up',
                      textSize: 23,
                      color: AppColor.purple,),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                      primary: AppColor.yellow,
                      shape: StadiumBorder(),
                    ),),
                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account?  ',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignInScreen()),
                              ),
                        text: 'Sign in',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.purple,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
              // Checkbox(value: value, onChanged: onChanged)
            ],
          ),
        ),
      ),
    );
  }
}
