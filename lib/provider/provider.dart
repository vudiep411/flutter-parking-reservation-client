import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Brightness _currentBrightness = Brightness.light;
  Color _textColor = Colors.black;
  int _idx = 0;
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  String? _jwtToken;
  String? _userEmail;

  Brightness get currentBrightness => _currentBrightness;
  Color get textColor => _textColor;
  int get idx => _idx;

  String? get jwtToken => _jwtToken;
  String? get userEmail => _userEmail;

  setJwtToken(String? token) {
    _jwtToken = token;
    notifyListeners();
  }

  setUserEmail(String? email) {
    _userEmail = email;
    notifyListeners();
  }

  setBrightness() {
    if (_currentBrightness == Brightness.light) {
      _currentBrightness = Brightness.dark;
      _textColor = Colors.white;
    } else {
      _currentBrightness = Brightness.light;
      _textColor = Colors.black;
    }
    notifyListeners();
  }

  setPageIdx(int idx) {
    _idx = idx;
    currentPageNotifier.value = idx;
    notifyListeners();
  }
}
