import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password.dart';
import 'package:sparepart/sign_in/model.dart';
import 'package:sparepart/sign_in/provider.dart';
import 'package:sparepart/sign_up/sign_up_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checkedValue = false;

  TextEditingController emailController;
  TextEditingController passwordController;
  SignInProvider signInProvider;
  bool _isEmail = false;
  bool _isPassword = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    signInProvider = Provider.of<SignInProvider>(context, listen:false);
    signInProvider.initialize(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _validateInput(){
    if (emailController.text.isEmpty ||
        !validateEmail(emailController.text)) {
      setState(() => _isEmail = true);
      return false;
    }

    if (passwordController.text.isEmpty||
        !isPasswordCompliant(passwordController.text)) {
      setState(() => _isPassword = true);
      return false;
    }

    return true;
  }

  void signIn() {
    FocusScope.of(context).unfocus();
    if (_validateInput())
      signInProvider.loginUser(
          map: SignInModel.toSignInJson(
              email: emailController.text.trim(),
              password: passwordController.text.trim()), context: context);
  }

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
              SizedBox(height: 20,),
              Container(
                height: 150,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    // colorFilter: new ColorFilter.mode(
                    //     AppColor.black.withOpacity(1), BlendMode.dstATop),
                    image: new AssetImage(
                      AppAssets.gapa_logo,
                    ),
                  ),
                ),
              ),
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
                label: 'please enter your email',
                isValidationError: _isEmail,
                textCallBack: (_) => setState(() => _isEmail = false),),
              SizedBox(height: 25,),
              EditTextWidget(
                err: 'please enter password',
                obsecure: true,
                textInputType: TextInputType.text,
                controller: passwordController,
                hintFontSize: 20,
                hint: 'Password',
                label: 'please enter your password',
                isValidationError: _isPassword,
                textCallBack: (_) => setState(() => _isPassword = false),),
              SizedBox(height: 45,),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: TextViewWidget(
                    text: 'Forgot Password',
                    color: AppColor.black,
                    textSize: 19,
                      ),
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
                    onPressed: ()=>signIn(),
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
              ),
              SizedBox(height: 50,),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Don\u0027t have an account?  ',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColor.black,
                        fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpScreen()),
                              ),
                        text: 'Sign up',
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
