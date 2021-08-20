import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:sparepart/screens/profile_screen/landing_screen/splashscreen.dart';
import 'package:sparepart/screens/profile_screen/main_screen.dart';
import 'package:sparepart/utils/color_assets/color.dart';
import 'package:sparepart/utils/page_route/route.dart';
import 'package:sparepart/utils/pref_manage.dart';
import 'package:sparepart/utils/providers.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String productName = "hv_box";

Future<void> main() async {

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColor.purple));
  await Hive.initFlutter();
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<ProductModel>(productName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getProviders,
      child: MaterialApp(
        title: 'Gapa Auto',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoutes,
      ),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SharedPreferencesHelper preferencesHelper;
  String email;
  bool newUser;

  @override
  void initState() {
    preferencesHelper = SharedPreferencesHelper();
    getEmail();
    super.initState();
  }

  getEmail() async {
    newUser = await preferencesHelper.doesExists(key: 'email');
    email =
    !newUser ? "" : await preferencesHelper.getStringValues(key: 'email');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (email == null)
      return SpinKitCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
                color: index.isEven ? Colors.white : AppColor.purple,
                shape: BoxShape.circle),
          );
        },
      );
    if (email == "" ) return SplashScreen();
    return MainScreen();
  }
}

