import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextViewWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String fontFamily;
  final int maxLines;
  final TextAlign textAlign;
  final Color color;

  bool showIconPicker;
  IconData iconData;
  VoidCallback onTapCallBack;

  TextViewWidget(
      {@required this.text,
        this.textSize,
        this.fontWeight,
        this.fontStyle,
        this.fontFamily,
        @required this.color,
        this.textAlign = TextAlign.left,
        this.maxLines,
        this.showIconPicker = false,
        this.iconData,
        this.onTapCallBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
            visible: showIconPicker,
            child: IconButton(
              color: Colors.black,
              icon: Icon(iconData),
              onPressed: onTapCallBack,
            )),
        Flexible(
          child: Text(
            text,
            maxLines: maxLines,
            textAlign: textAlign,
            style: TextStyle(
                color: color,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                fontSize: textSize),
          ),
        ),
      ],
    );
  }
}
