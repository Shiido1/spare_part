import 'package:flutter/cupertino.dart';
import 'package:sparepart/screens/profile_screen/main_screen.dart';
import 'package:sparepart/screens/profile_screen/offer/on_pressed_discount_screen.dart';
import 'package:sparepart/screens/profile_screen/verification/verification_screen.dart';
import 'package:sparepart/sign_in/sign_in_screen.dart';
import 'package:sparepart/sign_up/sign_up_screen.dart';

BuildContext globalContext;
bool hasOpenedLogOutDialog = false;

class Routes {
  static const String DASHBOARD_SCREEN = '/tailorDashboard';
  static const String LOGIN = '/login';
  static const String SIGN_UP = '/signup';
  static const String OTP = '/otp';
  static const String ON_PRESS_DESCRIPTION_SCREEN = '/onPressDescriptionScreen';

  static Map<String, Widget Function(BuildContext mainContext)> get getRoutes =>
      {
        LOGIN: (BuildContext context) {
          globalContext = context;
          return SignInScreen();
        },
        SIGN_UP: (BuildContext context) {
          globalContext = context;
          return SignUpScreen();
        },
        DASHBOARD_SCREEN: (BuildContext context) {
          globalContext = context;
          return MainScreen();
        },
        OTP: (BuildContext context) {
          globalContext = context;
          return Verify();
        },
        ON_PRESS_DESCRIPTION_SCREEN: (BuildContext context) {
          globalContext = context;
          return OnPressedDiscountScreen();
        },
      };
}