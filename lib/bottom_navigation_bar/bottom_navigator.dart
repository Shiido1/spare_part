import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/dashboard/dashboard_screen.dart';
import 'package:sparepart/screens/profile_screen/offer/offer_screen.dart';
import 'package:sparepart/screens/profile_screen/order/order_screen.dart';
import 'package:sparepart/screens/profile_screen/profile_screen/profile.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/widgets/image_loader.dart';

import 'custom_bottom_nav.dart';

class BottomNavigator extends StatefulWidget {
  int bottomNavIndex;

  BottomNavigator({@required this.bottomNavIndex});

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState(bottomNavIndex);
}

class _BottomNavigatorState extends State<BottomNavigator>
    with SingleTickerProviderStateMixin {
  int bottomNavIndex=0;
  String title;

  _BottomNavigatorState(this.bottomNavIndex);

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  // final _widgetList = <Widget>[
  //   Search(), // 0
  //   Container(), // 1
  //   Profile(), // 2
  //   Home(), // 3
  // ];
  // String iconSearch = AppAssets.home;


  final iconList = <String>[
    AppAssets.turkey, AppAssets.japan, AppAssets.chinese, AppAssets.english
  ];

  final screen = [DashBoard(),OrderScreen(),OfferScreen(),ProfileScreen()];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    onTabTapped(bottomNavIndex);
    _initAnimation();
    super.initState();
  }

  void _initAnimation() {
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
          () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // globalContext = context;
    return Scaffold(
      // extendBody: true,
      // key: _scaffoldKey,
      // body: Container(
      //   margin: const EdgeInsets.only(top: 50),
      //   child: Column(
      //     children: [
      //       // CustomAppBarWidget(title, onTap: () => openEndDrawer(_scaffoldKey)),
      //       Expanded(
      //         child: Container(
      //           margin: EdgeInsets.only(left: 16, right: 16),
      //           // child: _widgetList[bottomNavIndex],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: screen[bottomNavIndex],
      floatingActionButton: ScaleTransition(
        scale: animation,
        child: FloatingActionButton(
          backgroundColor: Color(0xff492F92),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              // boxShadow: [
              //   BoxShadow(
              //     color: Color(0xff492F92),
              //     blurRadius: 15.0,
              //     spreadRadius: 0.1,
              //   )
              // ],
            ),
            child: ImageLoader(
              path: AppAssets.shoppingCart,
              height: 27,
              width: 25,
              dColor: Color(0xff492F92),
            ),

          ),
          onPressed: () {},
          // => PageRouter.gotoWidget(Upload(), context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // endDrawer: ClipRRect(
      //   child: DrawerWidget(),
      // ),
      bottomNavigationBar: CustomAppBar(
        icons: iconList,
        backgroundColor: Color(0xff492F92),
        activeIndex: bottomNavIndex,
        activeColor: Colors.white,
        splashColor: Color(0xffF5CE4D),
        inactiveColor: Colors.white,
        notchAndCornersAnimation: animation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) async {
    setState(() {
      bottomNavIndex = index;
      if (bottomNavIndex == 0) {
        setState(() => title = "Search Content");
      }
      if (bottomNavIndex == 1) {
        setState(() => title = "");
        // _showSheet();
      }
      if (bottomNavIndex == 2) {
        setState(() => title = "Profile");
      }
      if (bottomNavIndex == 3) {
        setState(() => title = "Home");
      }
      // if (bottomNavIndex == 4) {
      //   setState(() => title = "Cream Bid");
      // }
      // if (bottomNavIndex == 5) {
      //   setState(() => title = "Wallet");
      // }
      // if (bottomNavIndex == 6) {
      //   setState(() => title = "Upload Content");
      // }
      // if (bottomNavIndex == 7) {
      //   setState(() => title = "Cream Music");
      // }
      // if (bottomNavIndex == 8) {
      //   setState(() => title = "Home");
      // }
      // if (bottomNavIndex == 9) {
      //   setState(() => title = "Music Play");
      // }
      // if (bottomNavIndex == 10) {
      //   setState(() => title = "Cream Video");
      // }
      // if (bottomNavIndex == 11) {
      //   setState(() => title = "Video Play");
      // }
      // if (bottomNavIndex == 12) {
      //   setState(() => title = "Wallet");
      // }
      // if (bottomNavIndex == 13) {
      //   setState(() => title = "Cream Images");
      // }
      // if (bottomNavIndex == 14) {
      //   setState(() => title = "Cream Images");
      // }
    });
  }

// void _showSheet() {
//   MusicPlaylistBottomSheet(
//       context: context, account: (accountNumber, bankName) {})
//       .show();
// }
}