import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:jaynetwork/interceptor/retry/add_interceptor.dart';
import 'package:jaynetwork/network/dio_client.dart';
import 'package:sparepart/utils/pref_manage.dart';
import 'package:toast/toast.dart';

final JayNetworkClient networkClient =
JayNetworkClient(
  'https://admin.gapaautoparts.com/api/',
    interceptors: addPredefinedInterceptor()
);

final BASE_URL = 'https://admin.gapaautoparts.com/api/';
final String url = 'https://gapaautoparts.com';
final SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();

void showToast(BuildContext context,
    {@required String message, int gravity = 0}) {
  Toast.show(message, context,
      backgroundRadius: 10, duration: 4, gravity: gravity);
}

bool validateEmail(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  var status = regExp.hasMatch(email);
  return status;
}

bool isPasswordCompliant(String password, [int minLength = 8]) {
  if (password == null || password.isEmpty) {
    return false;
  }
  bool _hasMinLength = password.length >= minLength;
  return _hasMinLength;
}

String getNairaSign(BuildContext context, dynamic amount) {
  // amount = double.parse(amount.toString()) / 100;
  if (amount.toString().contains('.')) {
    return '\u20A6$amount';
  }
  return '${NumberFormat.simpleCurrency(name: "NGN").format(int.parse(amount.toString()))}';
}