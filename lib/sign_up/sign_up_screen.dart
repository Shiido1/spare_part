import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/sign_in/sign_in_screen.dart';
import 'package:sparepart/sign_up/provider.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

import 'model.dart';

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
  TextEditingController addressController = TextEditingController();

  SignUpProviders signUpProviders;
  bool _isFirstName = false;
  bool _isLastName = false;
  bool _isEmail = false;
  bool _isPhone = false;
  bool _isPassword = false;
  bool _isAddress = false;

  bool _validateInputs() {
    if (firstNameController.text.isEmpty) {
      setState(() => _isFirstName = true);
      return false;
    }
    if (lastNameController.text.isEmpty) {
      setState(() => _isLastName = true);
      return false;
    }

    if (emailController.text.isEmpty ||
        !validateEmail(emailController.text)) {
      setState(() => _isEmail = true);
      return false;
    }

    if (phoneNoController.text.isEmpty) {
      setState(() => _isPhone = true);
      return false;
    }

    if (passwordController.text.isEmpty ||
        !isPasswordCompliant(passwordController.text)) {
      setState(() => _isPassword = true);
      return false;
    }

    if (addressController.text.isEmpty) {
      setState(() => _isAddress = true);
      return false;
    }
    return true;
  }

  void _signUpUser() {
    FocusScope.of(context).unfocus();
    if (!_validateInputs()) return;
    signUpProviders.signUp(
      map: SignUpModel.toJson(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          phone: phoneNoController.text.trim(),
          address: addressController.text.trim()
      )
    );
  }

  @override
  void initState() {
    signUpProviders = Provider.of<SignUpProviders>(context, listen: false);
    signUpProviders.init(context);
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    passwordController.dispose();
    addressController.dispose();
    super.dispose();
  }


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
              SizedBox(height: 15),
              TextViewWidget(
                text: 'Please enter your information below to sign in',
                color: AppColor.black,
                textSize: 18,
                fontWeight: FontWeight.w400,),
              SizedBox(height: 25),
              EditTextWidget(
                err: 'please enter your first name',
                textInputType: TextInputType.text,
                controller: firstNameController,
                hint: 'First Name',
                hintFontSize: 20,
                label: 'enter your first name',
                isValidationError: _isFirstName,
                textCallBack: (_) => setState(() => _isFirstName = false),),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter your last name',
                textInputType: TextInputType.text,
                controller: lastNameController,
                hint: 'Last Name',
                hintFontSize: 20,
                label: 'enter your last name',
                isValidationError: _isLastName,
                textCallBack: (_) => setState(() => _isLastName = false),),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter phone number',
                textInputType: TextInputType.number,
                controller: phoneNoController,
                hintFontSize: 20,
                hint: 'Phone No',
                label: 'enter your phone number',
                isValidationError: _isPhone,
                textCallBack: (_) => setState(() => _isPhone = false),),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter email',
                textInputType: TextInputType.text,
                controller: emailController,
                hintFontSize: 20,
                hint: 'Email',
                label: 'enter your email address',
                isValidationError: _isEmail,
                textCallBack: (_) => setState(() => _isEmail = false),),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter an eight digit password',
                textInputType: TextInputType.text,
                controller: passwordController,
                hintFontSize: 20,
                hint: 'Password',
                label: 'enter an eight digit password',
                isValidationError: _isPassword,
                textCallBack: (_) => setState(() => _isPassword = false),),
              SizedBox(height: 15,),
              EditTextWidget(
                err: 'please enter address',
                textInputType: TextInputType.text,
                controller: addressController,
                hintFontSize: 20,
                hint: 'Address',
                label: 'enter your address',
                isValidationError: _isAddress,
                textCallBack: (_) => setState(() => _isAddress = false),),
              SizedBox(height: 35,),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:25,right: 25,top: 30),
                  child: TextButton(
                    onPressed: ()=>_signUpUser(),
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
