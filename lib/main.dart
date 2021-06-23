import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparepart/bottom_navigation_bar/bottom_navigator.dart';
import 'package:sparepart/dashboard/dashboard_screen.dart';
import 'package:sparepart/screens/profile_screen/add_card/add_card.dart';
import 'package:sparepart/screens/profile_screen/category/category.dart';
import 'package:sparepart/screens/profile_screen/main_screen.dart';
import 'package:sparepart/utils/assetsString.dart';
import 'package:sparepart/widgets/image_loader.dart';
import 'bottom_navigation_bar/custom_bottom_nav.dart';
void main() {

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(bottomNavIndex: 6,),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
