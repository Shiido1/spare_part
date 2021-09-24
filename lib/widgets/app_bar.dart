import 'package:flutter/material.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/widgets/text_widget.dart';

AppBar defaultAppBar(BuildContext context,
    {String title = '',
    VoidCallback onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double elevation = .0,
    Widget leadingWidget,
    Color backgroundColor,
    Color color,
    List<Widget> actions,
    PreferredSizeWidget bottom,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    elevation: elevation,
    centerTitle: centerTitle,
    bottom: bottom,
    backgroundColor:
        backgroundColor != null ? backgroundColor : Colors.transparent,
    title: TextViewWidget(
      text: title,
      fontWeight: FontWeight.w600,
      textSize: 20,
      textAlign: TextAlign.center,
      color: color == null ? AppColor.black : color,
    ),
    actions: actions,
  );
}
