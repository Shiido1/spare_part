import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sparepart/dashboard/dashboard_screen.dart';
import 'package:sparepart/screens/profile_screen/profile_screen/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'offer/offer_screen.dart';
import 'order/order_screen.dart';
import 'package:sparepart/utils/assetsString.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex=0;
  final screen = [DashBoard(),OrderScreen(),OfferScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index:selectedIndex,
        backgroundColor: AppColor.purple,
        items:[
         SvgPicture.asset(AppAssets.home),
         SvgPicture.asset(AppAssets.order),
         SvgPicture.asset(AppAssets.offer),
         SvgPicture.asset(AppAssets.menu),
         ],
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInBack,
        animationDuration: const Duration(milliseconds: 200),
      ),
      body: screen[selectedIndex],
    );
  }
}
