import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

// ignore: must_be_immutable
class EditTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obsecure;
  final bool isPassword;
  final TextInputType textInputType;
  final String hint;
  final String err;
  final Function(String text) textCallBack;
  final Function(String text) submitted;
  final Function(String text) validator;
  final Function(String text) saved;
  final int maxLength;
  final TextStyle style;
  final TextAlign textAlign;
  final bool isValidationError;
  bool isEnabled;
  final bool showFlag;
  final bool showIconPicker;
  final bool showImageIconPicker;
  final bool readOnly;
  final VoidCallback iconPickerCallback;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatters;
  final double fontSize;
  final double hintFontSize;
  final bool togglePassword;
  final VoidCallback togglePasswordCallback;
  final IconData iconData;
  final IconData suffixIcon;
  final VoidCallback onTap;
  Widget imageIcon;
  final Color color;
  final InputDecoration decoration;
  final String assetsName;

  EditTextWidget({
    @required this.controller,
    this.label,
    this.obsecure = false,
    this.isPassword = false,
    @required this.textInputType,
    this.hint,
    @required this.err,
    this.textCallBack,
    this.submitted,
    this.style,
    this.textAlign = TextAlign.left,
    this.validator,
    this.onTap,
    this.saved,
    this.maxLength,
    this.focusNode,
    this.showFlag = false,
    this.readOnly = false,
    this.isValidationError = false,
    this.isEnabled = true,
    this.fontSize = 14,
    this.hintFontSize = 14,
    this.inputFormatters,
    this.togglePassword = false,
    this.showIconPicker = false,
    this.showImageIconPicker = false,
    this.iconPickerCallback,
    this.togglePasswordCallback,
    this.iconData,
    this.suffixIcon,
    this.imageIcon,
    this.color,
    this.decoration,
    this.assetsName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: hint != null ? true : false,
          child: TextViewWidget(
            text: hint,
            color: AppColor.black,
            textSize: hintFontSize,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.editTextBackground,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: <Widget>[
                Visibility(
                    visible: showIconPicker,
                    child: assetsName != null
                        ? SvgPicture.asset(assetsName)
                        : IconButton(
                            color: Colors.black,
                            iconSize: 28,
                            icon: Icon(iconData),
                            onPressed: iconPickerCallback,
                          )),
                SizedBox(
                  width: 25,
                ),
                Flexible(
                  child: TextFormField(
                    readOnly: readOnly,
                    onChanged: textCallBack,
                    maxLength: maxLength,
                    controller: controller,
                    onTap: onTap,
                    focusNode: focusNode,
                    cursorColor: AppColor.black,
                    // ignore: missing_return
                    validator: validator,
                    onSaved: saved,
                    textAlign: textAlign,
                    style: TextStyle(
                        fontSize: fontSize, fontWeight: FontWeight.w600),
                    obscureText: obsecure,
                    enabled: isEnabled,
                    keyboardType: textInputType,
                    inputFormatters: inputFormatters,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          suffixIcon,
                          color: AppColor.black,
                        ),
                        errorStyle: TextStyle(
                          color: AppColor.red,
                        ),
                        hintText: hint,
                        labelText: label,
                        labelStyle: TextStyle(
                            color: Colors.black54, fontSize: fontSize),
                        hintStyle: TextStyle(
                            color: AppColor.editTextBackground,
                            fontSize: fontSize),
                        border: InputBorder.none,
                        counterText: ''),
                  ),
                ),
                Visibility(
                  visible: showImageIconPicker,
                  child: showImageIconPicker ? imageIcon : Container(),
                ),
                _getPasswordIcon(
                    isPassword, togglePassword, togglePasswordCallback),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Visibility(
            visible: isValidationError,
            child: Text(
              err,
              style: TextStyle(color: Colors.red),
            ))
      ],
    );
  }
}

/// returns password icons
Widget _getPasswordIcon(
  bool isPassword,
  bool togglePassword,
  togglePasswordCallback,
) {
  return Visibility(
    visible: isPassword,
    child: IconButton(
        icon: !togglePassword
            ? Icon(
                Icons.visibility_off_outlined,
                color: AppColor.black,
              )
            : Icon(
                Icons.visibility_outlined,
                color: AppColor.black,
              ),
        onPressed: togglePasswordCallback),
  );
}
