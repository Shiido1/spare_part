import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/reset_password/provider.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';
import 'package:sparepart/widgets/textform_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();

  static fromJson(data) {}
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController tokenController = TextEditingController();

  ResetPasswordProvider resetPasswordProvider;

  resetPassword() {
    resetPasswordProvider.resetPassword(
        password: newPasswordController.text,
        confirmPassword: confirmNewPasswordController.text,
        otp: tokenController.text);
  }

  @override
  void initState() {
    resetPasswordProvider = Provider.of<ResetPasswordProvider>(context,listen:false);
    resetPasswordProvider.initialize(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.editTextBackground,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.yellow,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              TextViewWidget(
                text: 'Reset Password',
                color: AppColor.black,
                textSize: 26,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 23,
              ),
              EditTextWidget(
                err: 'please ente new password',
                textInputType: TextInputType.text,
                controller: newPasswordController,
                hint: 'New Password',
                hintFontSize: 20,
              ),
              SizedBox(
                height: 15,
              ),
              EditTextWidget(
                err: 'please confirm new password',
                textInputType: TextInputType.text,
                controller: confirmNewPasswordController,
                hint: 'Confirm New Password',
                hintFontSize: 20,
              ),
              SizedBox(
                height: 15,
              ),
              EditTextWidget(
                err: 'please enter otp token',
                textInputType: TextInputType.text,
                controller: tokenController,
                hint: 'Otp token',
                hintFontSize: 20,
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
                  child: TextButton(
                    onPressed: () => resetPassword(),
                    child: TextViewWidget(
                      text: 'Continue',
                      textSize: 23,
                      color: AppColor.purple,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 70.0, vertical: 10.0),
                      primary: AppColor.yellow,
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
