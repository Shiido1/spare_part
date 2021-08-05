
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sparepart/screens/profile_screen/verification/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';

OtpApiRepository _repository = OtpApiRepository();

class OtpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomLoader _progressIndicator;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomLoader(this._context);
  }

  void verifyOtp({@required String token}) async {
    try {
      _progressIndicator.showLoader();
      final _response = await _repository.verify(tokenMap: token);
      _response.when(success: (success, data, __) async {
        await _progressIndicator.hideLoader();
        showToast(this._context, message: success.message);
        PageRouter.gotoNamed(Routes.DASHBOARD_SCREEN, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) async {
         _progressIndicator.hideLoader();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
      notifyListeners();
    } catch (e) {
      _progressIndicator.hideLoader();
      debugPrint('Error: $e');
    }
  }

  void resendOtp(UtilityProvider utilityProvider,{@required String token}) async {
    try {
      _progressIndicator.showLoader();
      final _response = await _repository.resend(queryToken: token);
      _response.when(success: (success, data, __) async {
        await _progressIndicator.hideLoader();
        showToast(this._context, message: 'resending again');
        utilityProvider.startTimer(timeLimit: 4);
        PageRouter.gotoNamed(Routes.DASHBOARD_SCREEN, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) async {
        await _progressIndicator.hideLoader();
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
      });
      notifyListeners();
    } catch (e) {
      await _progressIndicator.hideLoader();
      debugPrint('Error: $e');
    }
  }
}

class UtilityProvider extends ChangeNotifier {
  Timer _timer;
  int seconds = 59;
  bool timerIsNotExpired = true;
  int minute = 4;
  // List<StateList> stateList = [];
  // List<dynamic> lga = [];
  // StateList stateData;
  bool isCleared = true;

  // static List<States> nigeriaModelEntity;

  void startTimer({int timeLimit}) {
    minute = timeLimit;
    const oneSec = const Duration(seconds: 1);
    seconds = 60;
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        timerIsNotExpired = true;
        notifyListeners();
        if (seconds == 0) {
          if (minute <= 4 && minute > 0) {
            minute = minute - 1;
            startTimer(timeLimit: minute);
          } else {
            timerIsNotExpired = false;
            notifyListeners();
          }
          timer.cancel();
        } else {
          seconds = seconds - 1;
          notifyListeners();
        }
      },
    );
  }

  void cancelTimer() {
    _timer.cancel();
    notifyListeners();
  }

  /// @load from assets
  // Future<void> loadStateAssets() async {
  //   final _response = await rootBundle.loadString('assets/files/states.json');
  //   var _states = json.decode(_response);
  //   List<dynamic> list = _states['states'];
  //   for (var map in list) {
  //     StateList _state = StateList(state: map['name'], lga: map['lgas']);
  //     stateList.add(_state);
  //     stateList.sort((a, b) => a.state.compareTo(b.state));
  //     notifyListeners();
  //   }
  // }

  void clearDropDownList(bool isCleared) {
    this.isCleared = isCleared;
    notifyListeners();
  }

// onStateChange(data) {
//   stateData = data;
//   lga = stateData.lga;
//   notifyListeners();
// }

// resetData() {
//   stateList = [];
// }
}